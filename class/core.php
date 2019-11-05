<?php

class Core {
    public function snippetData($data) {
        $query = "SELECT * FROM `snippet_table`";
        $params = [];

        if ($data['searchFor'] != '') {
            $searchString = "%{$data['searchFor']}%";
            switch ($data['selectedFilter']) {
                case 'All':
                    $query .= " WHERE `title` like ? OR `data` like ? OR `tags` like ? OR `description` like ? ";
                    $params[] = $searchString;
                    $params[] = $searchString;
                    $params[] = $searchString;
                    $params[] = $searchString;

                break;

                case 'Title':
                    $query .= " WHERE `title` like ? ";
                    $params[] = $searchString;

                break;

                case 'Code':
                    $query .= " WHERE `data` like ? ";
                    $params[] = $searchString;

                break;

                case 'Tag':
                    $query .= " WHERE `tags` like ? ";
                    $params[] = $searchString;

                break;

                case 'Desc.':
                    $query .= " WHERE `description` like ? ";
                    $params[] = $searchString;

                break;

                default:
                    $query .= " WHERE `title` like ? OR `data` like ? OR `tags` like ? OR `description` like ? ";
                    $params[] = $searchString;
                    $params[] = $searchString;
                    $params[] = $searchString;
                    $params[] = $searchString;

                break;
            }
        }
        $query .= " ORDER BY `id` DESC";

        $data = db::fetchAll($query, $params) ? : [];

        for ($i = 0; $i < count( $data ); $i++) {
            $data[$i]['lang'] = strtolower($data[$i]['lang']);
            $data[$i]['title'] = htmlspecialchars($data[$i]['title']);
            $data[$i]['data'] = htmlspecialchars($data[$i]['data']);
            $data[$i]['dataRaw'] = $data[$i]['data'];
            $data[$i]['tags'] = explode(',,,', $data[$i]['tags']);
            $data[$i]['description'] = htmlspecialchars($data[$i]['description']);
        }

        return $data;
    }
    public function getThemeURL($id) {
        return db::fetchColumn(
            "SELECT `url` FROM `snippet_themes` WHERE `id`=?",
            [$id]
        );
    }
}
