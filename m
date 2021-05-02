Return-Path: <SRS0=fRoa=J5=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=yafUltTihEGEmK30kmHafeg7hS1+db0JlHKHhbK2/3U=;
        b=MecYYFTnIkXVAg4VHGkBypge3iTez/znTSyVmFolVXXguOWjlp423QoK9PRWt5Qmgz
         d1Z0XmefuMu3Y2ybjI7+xzvjuLvTqeJZYTRaT+mOUgan4pHxs3GxM5M5XsxVMl7h7+3B
         LCGhGxa62tkftmr1WwWj4YJiQ5urHFiWx5JNZJRkce2HyIQr9YFJGYGyigxOVQyHPLCp
         jN7hz803ES95l/mSBKCZZBXXoLCi2qWcP/S0fTif521PRkQPBov6LolGbNf0SZAPs4hA
         Guwq0mBo3XxdY/6AT11ZTv5Cj+TL+Yz/Udy0qd3dmFBJi58EXKtEpjgA02n1wvxSTluX
         UXIQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] utilities/autodate.sh: Fix potential hung-up on
 missing tcolorbox
Message-ID: <ad5501f7-e63c-1cc2-0e49-c93109ec75d5@gmail.com>
Date: Sun, 2 May 2021 20:40:42 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

"kpsewhich tcolorbox.sty" can be empty if tcolorbox is not
available.

If this is the case, "grep" in `grep ProvidePackage | sed ...`
will wait forever.

Add an empty check in front of "grep" with exit code of 1.

Fixes: b2f19231bcc5 ("utilities/autodate.sh: Make newer tcolorbox behave as before")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/autodate.sh | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/utilities/autodate.sh b/utilities/autodate.sh
index 7bd7cbb8..2b9c1117 100644
--- a/utilities/autodate.sh
+++ b/utilities/autodate.sh
@@ -97,6 +97,13 @@ env printf '\\IfQqzBg{}{\\setboolean{qqzbg}{%s}}\n' $qqzbg
 
 # command for newer tcolorbox (4.40 or later) to have backward-compatible skips
 tcolorbox_sty=`kpsewhich tcolorbox.sty`
+
+if [ "$tcolorbox_sty" == "" ]
+then
+	echo "Error: package 'tcolorbox' not found. See See #9 in FAQ-BUILD.txt" >&2
+	exit 1
+fi
+
 tcbversion=`grep ProvidesPackage $tcolorbox_sty | sed -e 's/.*version \([0-9]\+\.[0-9]\+\).*/\1/g'`
 tcbold=4.39
 env printf '%% tcolorbox version: %s\n' $tcbversion
-- 
2.17.1

