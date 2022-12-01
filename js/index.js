$('.datepicker').datepicker({
    // Escape any “rule” characters with an exclamation mark (!).
    format: 'You selecte!d: dddd, dd mmm, yyyy',
    formatSubmit: 'yyyy/mm/dd',
    hiddenPrefix: 'prefix__',
    hiddenSuffix: '__suffix'
  })