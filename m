Return-Path: <SRS0=TOwi=2N=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=y8lVMFm/gOLWCdrtrXfuQTVKECEel4R+Vh/dKq2SYUw=;
        b=jl6vb3KUKbTi5xUr57T6YKgU7xZmJwhtOLp176CxkATzaSAEomwqjxdHYCGPDRAuQA
         TgyFJjrzvOUctbnTM1wpv6tL1zGcWmsJu2zAAU6AzXY9XWYEVqaqDTfRkiIzLXE3EuSc
         8B7soQAk+DDJfVqxJ9crkvlKx0mzvv4KGrMYtI58QF0MU1j+kFUVcGVk/dqpcVxzKtt1
         9LxYtDOpFRWIXcxlYWo2Jq68tW8/1E4XFGpB7A8kcUyszJBXacmMB90/LkO4j6QEMImk
         VyxqsMnFiZauRxaR84CwOTDJvBh2UsvUi6QOfO5eOiFef2gZK5TTUNUvv/KHo/gI6ptb
         SX9w==
Subject: [PATCH v2] utilities/autodate: Restore compatibility with bash
References: <f9c54c72-db80-f29e-76c5-2d36c02c183a@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b9691f42-5edb-d57f-3a11-d6ce7a7b930e@gmail.com>
Date: Mon, 23 Dec 2019 20:55:08 +0900
MIME-Version: 1.0
In-Reply-To: <f9c54c72-db80-f29e-76c5-2d36c02c183a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 43bf4cc57125d756ccd14b629692c4ecdb5c36dc Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 23 Dec 2019 20:52:46 +0900
Subject: [PATCH v2] utilities/autodate: Restore compatibility with bash

Also improve uses of single quotes (without escaping) and
double quotes (with escaping) in the script.

Fixes: 650f763c31e8 ("utilities/autodate: Mark released versions")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Changes in v2:

    o Modified title
    o Tested with both "dash" and "bash" as /bin/sh

        Thanks, Akira
--
 utilities/autodate.sh | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/utilities/autodate.sh b/utilities/autodate.sh
index 4e448976..644123a3 100644
--- a/utilities/autodate.sh
+++ b/utilities/autodate.sh
@@ -47,9 +47,8 @@ year=`date --date="$date_str" +%Y`
 day=`date --date="$date_str" +%e`
 if test -n "$release"
 then
-	release="\\\\\\\\ Release $release"
+	release=`env printf '%s %s' '\\\\' "Release $release"`
 fi
 
-# env printf "\\date{%s %s, %s %s %s}\n" $month $day $year $modified $release
-echo "\\date{$month $day, $year $modified $release}"
-env printf "\\\newcommand{\\\commityear}{%s}\n" $year
+env printf '\\date{%s %s, %s %s %s}\n' $month $day $year $modified "$release"
+env printf '\\newcommand{\\commityear}{%s}\n' $year
-- 
2.17.1


