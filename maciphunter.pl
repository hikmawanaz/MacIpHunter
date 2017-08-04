#!/usr/bin/perl -w
$abc = 0;
$bulean = 1;
while ($bulean) {
	if (testcon()) {
		print "connected";
		last if $abc == 6;
		$bulean = 0;
		} else {
			printf("wait \n");
			system("osascript huaweidiscon.applescript");
			sleep 13;
			system("osascript huaweicon.applescript");
			sleep 8;
		}

}



sub testcon
{
my $ipcek = q{ifconfig | grep "inet " | grep -Fv 127.0.0.1 | grep -Fv 192.168.56.1 | awk '{print $2}'};
@tcek = `$ipcek`;
$ipres = substr($tcek[0],0,5);
$str2 = "10.18";
if ($ipres eq $str2) {
return 1;
$abc = 6;
}
else {
	$abc = 7;
return 0;
};
}