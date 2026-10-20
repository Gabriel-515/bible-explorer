(function (global) {
  'use strict';

  const STORAGE_KEY = 'bibleExplorerState';
  const DEFAULT_STATE = Object.freeze({
    readingStyle: 'hybrid',
    currentSkin: 0,
    gold: 0,
    chaptersRead: [],
    currentChapter: 1,
    bookmarks: []
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

    return { readingStyle, currentSkin, gold, chaptersRead, currentChapter, bookmarks };
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
    reset() {
      return writeState(DEFAULT_STATE);
    }
  });

  writeState(readState());
})(window);
