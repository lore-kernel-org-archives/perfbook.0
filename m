Return-Path: <SRS0=nUow=JS=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hxXYYfZBwgQeBTc7Jo39nL5B/rr+DWf8NTNsgT9mch0=;
        b=ekwHC2TqdijfRO2aTWkC1wIyZhe77IBNZv2TJze1h/N6ADXsMIPs7oJkWks3ZbYKtZ
         yYWTWXw/5iRfgKFJ4rVfbMEBreMuA+6lDOPaz38jGlu0nwzOieYrg2T3+qUecsDF50W6
         xUiUpKUA0GCQ7LjMlwFZ786HStGGSCqDEuLUd3nlYLq61Tl4JEfpFvewDWh4ceDt22A1
         X1MV7/mwmwxb/LuLu5BKp6ADCiC4VnjK0OVOwr5PKLXFPGNBOqkUWk+ThlokMHNkxtuy
         jum4lnXWvtTlSwf4tXbdCkM/MpJrl+IVG2EPKpVmT36m708vCw3kWCgS8CJ/+O2lm/H5
         b0Fw==
Subject: [PATCH -perfbook 1/4] synctex-forward: Update target list
References: <5a17ce08-9c5d-5e87-6cae-793c6a49c147@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <661c75b6-cdf8-cc4c-727b-2fb932d40164@gmail.com>
Date: Thu, 22 Apr 2021 00:26:33 +0900
MIME-Version: 1.0
In-Reply-To: <5a17ce08-9c5d-5e87-6cae-793c6a49c147@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/synctex-forward.sh | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/utilities/synctex-forward.sh b/utilities/synctex-forward.sh
index f4107728..04bdc14d 100755
--- a/utilities/synctex-forward.sh
+++ b/utilities/synctex-forward.sh
@@ -38,15 +38,19 @@ if [ $# -eq 0 ] ; then
 	change="reverted"
 else
 	case $1 in
-	2c)
+	2c|qq)
 		main="perfbook.tex"
 		change="reverted"
 		;;
-	1c|hb|a4|tcb|msnt|mstx|msr|msn|sf|msns|mss|qq|nq|ix)
+	1c|hb|a4|tcb|msnt|mstx|msr|msn|sf|msns|mss|nq|ix|df)
 		main="perfbook-$1.tex"
 		change="modified"
 		;;
-	1ctcb|1cmsnt|1cmstx|1cmsr|1cmsn|1csf|1cmsns|1cmss|1cqq|1cnq|1cix)
+	1ctcb|1cmsnt|1cmstx|1cmsr|1cmsn|1csf|1cmsns|1cmss|1cnq|1cix|1cdf)
+		main="perfbook-$1.tex"
+		change="modified"
+		;;
+	eb|ebsf|ebnq|ebsfnq|ebix|ebdf)
 		main="perfbook-$1.tex"
 		change="modified"
 		;;
-- 
2.17.1


