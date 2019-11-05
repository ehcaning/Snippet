<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Ehcan's Snippet</title>
    <meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no, shrink-to-fit=no">
    <meta name="description" content="My personal Code Snippets, open to use for everyone.">
    <link rel="icon" type="image/png" sizes="32x32" href="assets/images/snippet/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/snippet/favicon-16x16.png">

    <link href="https://fonts.googleapis.com/css?family=Lato|Raleway" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link href="assets/css/style.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="<?= $themeURL  ?>">
    <script src="//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/highlight.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.11.1/build/alertify.min.js"></script>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.11.1/build/css/alertify.min.css"/>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.11.1/build/css/themes/bootstrap.min.css"/>
</head>
<body>
    <div class="fixed-div">
        <div class="absolute-top">
            <input id="main-search" type="text" placeholder="Search..." autofocus/>
            <div class="btn-group" id="btn-group" role="group" aria-label="Filters">
                <button type="button" class="btn btn-success">All</button>
                <button type="button" class="btn btn-light">Title</button>
                <button type="button" class="btn btn-light">Code</button>
                <button type="button" class="btn btn-light">Tag</button>
                <button type="button" class="btn btn-light">Desc.</button>
            </div>
        </div>
    </div>
    <div class="results-div">
    </div>

</body>
<script src="assets/js/snippet/main.js"></script>
</html>
