(function (global) {
  'use strict';

  const STORAGE_KEY = 'bibleExplorerState';
  const LOCATIONS = Object.freeze([
    { id: 1, name: 'Garden of Eden', chapters: [1, 2, 3], scene: null },
    { id: 2, name: 'East of Eden', chapters: [4], scene: null },
    { id: 3, name: 'Ancient World', chapters: [5], scene: null },
    { id: 4, name: 'Mount Ararat', chapters: [6, 7, 8, 9], scene: null },
    { id: 5, name: 'Plain of Shinar', chapters: [10, 11], scene: 'babel-landing.html' },
    { id: 6, name: 'Land of Canaan', chapters: [12, 13, 14], scene: null },
    { id: 7, name: 'Oaks of Mamre', chapters: [15, 16, 17, 18, 19, 20], scene: null },
    { id: 8, name: 'Mount Moriah', chapters: [21, 22, 23, 24, 25], scene: null },
    { id: 9, name: 'Beer-lahai-roi', chapters: [26, 27, 28], scene: null },
    { id: 10, name: 'Paddan-aram', chapters: [29, 30, 31, 32, 33, 34, 35, 36], scene: null },
    { id: 11, name: 'Egypt', chapters: [37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50], scene: null }
  ]);
  const DEFAULT_STATE = Object.freeze({
    version: 2,
    readingStyle: 'hybrid',
    currentSkin: 0,
    gold: 0,
    chaptersRead: [],
    currentChapter: 1,
    bookmarks: [],
    rewardedQuizChapters: [],
    completedMissions: [],
    lastSavedAt: null
  });

  let memoryState = null;

  function clone(value) {
    return JSON.parse(JSON.stringify(value));
  }

  function normalize(raw) {
    const value = raw && typeof raw === 'object' ? raw : {};
    const readingStyle = value.readingStyle === 'futuristic' ? 'futuristic' : 'hybrid';
    const currentSkin = [0, 1, 2].includes(Number(value.currentSkin)) ? Number(value.currentSkin) : 0;
    const gold = Number.isFinite(Number(value.gold)) ? Math.max(0, Math.floor(Number(value.gold))) : 0;
    const chaptersRead = Array.isArray(value.chaptersRead)
      ? [...new Set(value.chaptersRead.map(Number).filter(chapter => Number.isInteger(chapter) && chapter >= 1 && chapter <= 50))].sort((a, b) => a - b)
      : [];
    const currentChapter = Number.isInteger(Number(value.currentChapter))
      ? Math.min(50, Math.max(1, Number(value.currentChapter)))
      : 1;
    const bookmarks = Array.isArray(value.bookmarks)
      ? value.bookmarks.reduce((items, bookmark) => {
          const chapter = Number(bookmark && bookmark.chapter);
          const verse = Number(bookmark && bookmark.verse);
          if (!Number.isInteger(chapter) || !Number.isInteger(verse) || chapter < 1 || chapter > 50 || verse < 1) return items;
          if (!items.some(item => item.chapter === chapter && item.verse === verse)) items.push({ chapter, verse });
          return items;
        }, [])
      : [];

    const rewardedQuizChapters = Array.isArray(value.rewardedQuizChapters)
      ? [...new Set(value.rewardedQuizChapters.map(Number).filter(chapter => Number.isInteger(chapter) && chapter >= 1 && chapter <= 50))].sort((a, b) => a - b)
      : [];
    const completedMissions = Array.isArray(value.completedMissions)
      ? [...new Set(value.completedMissions.map(Number).filter(id => Number.isInteger(id) && id >= 1 && id <= LOCATIONS.length))].sort((a, b) => a - b)
      : [];
    const lastSavedAt = typeof value.lastSavedAt === 'string' ? value.lastSavedAt : null;

    return {
      version: 2,
      readingStyle,
      currentSkin,
      gold,
      chaptersRead,
      currentChapter,
      bookmarks,
      rewardedQuizChapters,
      completedMissions,
      lastSavedAt
    };
  }

  function readState() {
    try {
      const stored = global.localStorage.getItem(STORAGE_KEY);
      return stored ? normalize(JSON.parse(stored)) : clone(DEFAULT_STATE);
    } catch (error) {
      return memoryState ? clone(memoryState) : clone(DEFAULT_STATE);
    }
  }

  function writeState(nextState) {
    const normalized = normalize(nextState);
    memoryState = clone(normalized);
    try {
      global.localStorage.setItem(STORAGE_KEY, JSON.stringify(normalized));
    } catch (error) {
      // The memory copy keeps the prototype usable when storage is unavailable.
    }
    return clone(normalized);
  }

  global.GameState = Object.freeze({
    defaults: clone(DEFAULT_STATE),
    locations: clone(LOCATIONS),
    getState() {
      return readState();
    },
    get(key) {
      return readState()[key];
    },
    set(key, value) {
      if (!(key in DEFAULT_STATE)) return readState();
      return writeState({ ...readState(), [key]: value });
    },
    update(changes) {
      const safeChanges = changes && typeof changes === 'object' ? changes : {};
      return writeState({ ...readState(), ...safeChanges });
    },
    completeChapter(chapter) {
      const chapterNumber = Number(chapter);
      if (!Number.isInteger(chapterNumber) || chapterNumber < 1 || chapterNumber > 50) return readState();
      const state = readState();
      const chaptersRead = [...new Set([...state.chaptersRead, chapterNumber])].sort((a, b) => a - b);
      const nextUnread = Array.from({ length: 50 }, (_, index) => index + 1).find(item => !chaptersRead.includes(item));
      return writeState({
        ...state,
        chaptersRead,
        currentChapter: nextUnread || 50,
        lastSavedAt: new Date().toISOString()
      });
    },
    awardQuiz(chapter, correct) {
      const chapterNumber = Number(chapter);
      const state = readState();
      if (!Number.isInteger(chapterNumber) || chapterNumber < 1 || chapterNumber > 50) {
        return { state, awarded: 0 };
      }
      if (state.rewardedQuizChapters.includes(chapterNumber)) return { state, awarded: 0 };
      const awarded = correct ? 30 : 10;
      const nextState = writeState({
        ...state,
        gold: state.gold + awarded,
        rewardedQuizChapters: [...state.rewardedQuizChapters, chapterNumber].sort((a, b) => a - b),
        lastSavedAt: new Date().toISOString()
      });
      return { state: nextState, awarded };
    },
    getLocationProgress(locationId) {
      const location = LOCATIONS.find(item => item.id === Number(locationId));
      const state = readState();
      if (!location) return null;
      const completed = location.chapters.filter(chapter => state.chaptersRead.includes(chapter));
      return {
        ...clone(location),
        completedChapters: completed,
        unlocked: completed.length === location.chapters.length,
        completed: state.completedMissions.includes(location.id)
      };
    },
    completeMission(locationId) {
      const location = LOCATIONS.find(item => item.id === Number(locationId));
      if (!location) return readState();
      const state = readState();
      if (!location.chapters.every(chapter => state.chaptersRead.includes(chapter))) return state;
      return writeState({
        ...state,
        completedMissions: [...new Set([...state.completedMissions, location.id])].sort((a, b) => a - b),
        lastSavedAt: new Date().toISOString()
      });
    },
    save() {
      return writeState({ ...readState(), lastSavedAt: new Date().toISOString() });
    },
    reset() {
      return writeState(DEFAULT_STATE);
    }
  });

  writeState(readState());
})(window);
