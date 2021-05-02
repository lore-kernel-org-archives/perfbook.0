Return-Path: <SRS0=fRoa=J5=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5UrTf3aVMwjiTPSF8pyan4F2Wxn1XprNxF9EETPfIAA=;
        b=sLIRlY92XL8MCyIFn9qSAoTquRnmxpc9cpiKFT1pJRr4Ys5r8eenlJGjicA7NS5kfd
         rifnm5c0QQAX23gLW/+yNqmrC8zMGLCmdOP92pBo83cgYT+eCqE56QIkwoCSNHSWONDq
         pCpfxh09ZWWzLELZ9uUTNGm0HNJsAZ+JyxJOubS/6A+mzH45DuUXf3rrlYCDgqiqiJUs
         4CWQs0RvKa3YBe36JISwP2yOcBtWEhHRMwiCDLXMrKy2k/XAhS0VPx6hS6ir5MDgOw1u
         whf1ArMw+9yctNcYQQCWQrrOR9X6SUhVRruUv2Ael8X0zhWipsUdaqxDERWQfARTR75b
         Wniw==
Subject: [PATCH -perfbook v2] utilities/autodate.sh: Fix potential hung-up on
 missing tcolorbox
References: <ad5501f7-e63c-1cc2-0e49-c93109ec75d5@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a276dcac-cfab-b617-9790-1c9a4c37dbc5@gmail.com>
Date: Sun, 2 May 2021 22:01:13 +0900
MIME-Version: 1.0
In-Reply-To: <ad5501f7-e63c-1cc2-0e49-c93109ec75d5@gmail.com>
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
Change since v1:

o Fix string comparison operator of shell script ("=")

--
utilities/autodate.sh | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/utilities/autodate.sh b/utilities/autodate.sh
index 7bd7cbb8..acf3b051 100644
--- a/utilities/autodate.sh
+++ b/utilities/autodate.sh
@@ -97,6 +97,13 @@ env printf '\\IfQqzBg{}{\\setboolean{qqzbg}{%s}}\n' $qqzbg
 
 # command for newer tcolorbox (4.40 or later) to have backward-compatible skips
 tcolorbox_sty=`kpsewhich tcolorbox.sty`
+
+if [ "$tcolorbox_sty" = "" ]
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


