Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=yWEUBUrFo7mNgXvXX8CEyM32cEYXm4xq7rqCTPhzWcw=;
 b=dsBW/2nZHl+w2RUYgcjEPgjE/vudvmrba749zsXxNOMlMOkjXSlNpk09jD1og458RU
 277+h343vl2sRKapSIPZLSUUsNoXaUafcRle6kEyCjBSKQlm/ENaXRPj9IYvS7V1L8Mt
 Lhn9uMu4EQMFza1jmJrBr+M34FBfNw6ma/aoWM2R1EYZfgN2Hk0lDtU0P6s5EaiUlp6A
 MWh3CDksALP/73onfhWgqXPiFuX/qnvI7uZb1nis6xTmWtGmj70cIeTSsrIVpVMog993
 2jHBQyfBi1yqZDJxvnUVweoYTpUmWLvoOAjaDlXThsjAcHFKJkBgS+WPpTWxXOSwTwrf
 Sv2g==
Subject: [PATCH] autodate.sh: Use printf instead of echo
References: <20170116234125.28692-1-twoerner@gmail.com>
 <d63ae83f-f918-73df-14f1-a7eb01f99e66@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <898ffe7c-cc25-773d-28a1-ff9c7f9c97e0@gmail.com>
Date: Tue, 17 Jan 2017 20:33:10 +0900
MIME-Version: 1.0
In-Reply-To: <d63ae83f-f918-73df-14f1-a7eb01f99e66@gmail.com>
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
To: Trevor Woerner <twoerner@gmail.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, akiyks@gmail.com
List-ID: <perfbook.vger.kernel.org>

From bcd083c6be7cd9c69d1e05d19d732c32147bfd9a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 17 Jan 2017 20:04:54 +0900
Subject: [PATCH] autodate.sh: Use printf instead of echo

Using "echo" command to generate output containing "\" characters
caused a build error depending on the variant of "sh".
For portability, we should use "printf" via "env" command.

Fixes: 878bf8160a5c
Reported-by: Trevor Woerner <twoerner@gmail.com>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/autodate.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/utilities/autodate.sh b/utilities/autodate.sh
index 6df8f99..a56bc70 100644
--- a/utilities/autodate.sh
+++ b/utilities/autodate.sh
@@ -35,7 +35,7 @@ else
 	gitstatus=`git status --porcelain | wc -l`
 	if [ $gitstatus != "0" ]
 	then
-		modified=" (m)"
+		modified="(m)"
 	else
 		modified=""
 	fi
@@ -44,5 +44,5 @@ month=`date --date="$date_str" +%B`
 year=`date --date="$date_str" +%Y`
 day=`date --date="$date_str" +%e`

-echo "\\date{$month $day, $year$modified}"
-echo "\\\newcommand{\\\commityear}{$year}"
+env printf "\\date{%s %s, %s %s}\n" $month $day $year $modified
+env printf "\\\newcommand{\\\commityear}{%s}\n" $year
-- 
2.7.4


