<?php
date_default_timezone_set('Asia/Tehran');
# include all classes
foreach (glob("./class/*.php") as $filename) {
    include $filename;
}

@session_start();
db::init();

route('GET', '/', function () {
    $core = new Core;
    $themeURL = $core->getThemeURL(THEME_ID);

    return response(
        phtml(
            __DIR__ . '/views/index',
            ['themeURL' => $themeURL]
        )
    );
});

route('POST', '/api/getSnippetData', function () {
    $core = new Core;

    return jsonResponse(
        $core->snippetData($_POST)
    );
});

$notFountURL = '/' . trim(parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH), '/');
route('GET', $notFountURL, function () {
    return response(phtml(__DIR__ . '/views/index'));
});

dispatch();
