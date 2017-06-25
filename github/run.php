<?
// etape on on liste les fichiers .md

$contenu = file_get_contents("https://github.com/dev-a/Memo");
$regex = "/<a href=\"(.*?)\".*?id.*?md<\/a>/";
preg_match_all($regex, $contenu, $matches, PREG_OFFSET_CAPTURE, 3);
$md_list = array();

foreach($matches[1] as $value)
	{
	if (substr($value[0], -9) != "README.md")
    $md_list[] = $value[0];
	}

echo "------------------------------\n";

$tab_view=array("h1"=>"","h2"=>"\t","h3"=>"\t\t","H1"=>"","H2"=>"\t","H3"=>"\t\t");

foreach($md_list as $key => $value1)
	{
	$contenu = file_get_contents("https://github.com/" . $value1);
	$regex = "/<article.*?<\/article>/ms";
	preg_match_all($regex, $contenu, $matches, PREG_OFFSET_CAPTURE, 3);
	$contenu=$matches[0][0][0];

  $regex = "/<h[1-5]>.*?<\/h[1-5]>/";
	preg_match_all($regex, $contenu, $matches, PREG_OFFSET_CAPTURE, 3);


  foreach ($matches[0] as $key => $value) {
    $hx=substr($value[0],1,2);
    if($hx=="H1"||$hx=="h1")
    {
      //echo $tab_view[$hx]."- [".substr(basename($value1),0,-3)."](".basename($value1)")\n";
      echo $tab_view[$hx]."- [".substr(basename($value1),0,-3)."](".basename($value1).")\n";
    }else{
      preg_match("/href=\"(.*?)\"/",$value[0], $links);
      $link = $links[1];
      echo $tab_view[$hx]."- [".strip_tags($value[0])."](".basename($value1).$link.")\n";
    }

    $last_key=$key;
  }


	}


?>
