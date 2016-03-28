var interfaceConfig = {
    CANVAS_EXTRA: 104,
    CANVAS_RADIUS: 7,
    SHADOW_COLOR: '#ffffff',
    INITIAL_TOOLBAR_TIMEOUT: 20000,
    TOOLBAR_TIMEOUT: 4000,
    DEFAULT_REMOTE_DISPLAY_NAME: "Participant",
    DEFAULT_LOCAL_DISPLAY_NAME: "me",
    SHOW_JITSI_WATERMARK: true,
    JITSI_WATERMARK_LINK: "http://www.exoplatform.com",
    SHOW_BRAND_WATERMARK: false,
    BRAND_WATERMARK_LINK: "",
    SHOW_POWERED_BY: false,
    GENERATE_ROOMNAMES_ON_WELCOME_PAGE: false,
    APP_NAME: "eXo Meet",
    INVITATION_POWERED_BY: true,
    DOMINANT_SPEAKER_AVATAR_SIZE: 100,
    TOOLBAR_BUTTONS: ['authentication', 'microphone', 'camera', 'desktop',
        'recording', 'security', 'invite', 'sharedvideo',
        'fullscreen', 'sip', 'dialpad', 'settings', 'hangup', 'filmstrip',
        'contacts'],
    // Determines how the video would fit the screen. 'both' would fit the whole
    // screen, 'height' would fit the original video height to the height of the
    // screen, 'width' would fit the original video width to the width of the
    // screen respecting ratio.
    VIDEO_LAYOUT_FIT: 'both',
    /**
     * Whether to only show the filmstrip (and hide the toolbar).
     */
    filmStripOnly: false,
    RANDOM_AVATAR_URL_PREFIX: false,
    RANDOM_AVATAR_URL_SUFFIX: false,
    FILM_STRIP_MAX_HEIGHT: 160
};
