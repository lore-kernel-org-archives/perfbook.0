Return-Path: <SRS0=fRoa=J5=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QyyYsKSUp2MnhstAEnNCRFDwOQi05QaX9GdRRtoGRA4=;
        b=suPW9Y7SvqvxdPLa18LHPVH7G8+nFk933fNZCu/Gd87SojGDNICJXqKdetySLlBRQx
         5yQ63raXlSjlrCLPm9H5Vlq3Sg64DQvInCUkmMzMysDGT7VuaoN7S5HcnNX6S4+cyL9k
         i0QPFokxi8HMH+8xT0WghwBzYtgY1kG4q/CG/rYD/tTsy5kcHiAeeL2ix1MCOipFXhMm
         7KZka49OnLZ1JdQ/iAMHfnArtSIS3MAGIJ0IvpVocTu6JMSLMQWDXcji3h2yQikP3JPH
         0y7JPGQ76NmqAq/omjt/0FDGYsf8sLglR3rUEJuYFYALGB65zWEfk1k04CwLXuGoBAcj
         F6BQ==
Subject: [PATCH -perfbook v3] utilities/autodate.sh: Fix potential hung-up on
 missing tcolorbox
References: <ad5501f7-e63c-1cc2-0e49-c93109ec75d5@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e62f6062-5416-a5f7-83fb-74d0838d0498@gmail.com>
Date: Sun, 2 May 2021 22:53:07 +0900
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
Change since v2:

o Refer to #5 in FAQ-BUILD.txt, as tcolorbox is not a font package.

Change since v1:

o Fix string comparison operator of shell script ("=").

--
utilities/autodate.sh | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/utilities/autodate.sh b/utilities/autodate.sh
index 7bd7cbb8..7d00738f 100644
--- a/utilities/autodate.sh
+++ b/utilities/autodate.sh
@@ -97,6 +97,13 @@ env printf '\\IfQqzBg{}{\\setboolean{qqzbg}{%s}}\n' $qqzbg
 
 # command for newer tcolorbox (4.40 or later) to have backward-compatible skips
 tcolorbox_sty=`kpsewhich tcolorbox.sty`
+
+if [ "$tcolorbox_sty" = "" ]
+then
+	echo "Error: package 'tcolorbox' not found. See See #5 in FAQ-BUILD.txt" >&2
+	exit 1
+fi
+
 tcbversion=`grep ProvidesPackage $tcolorbox_sty | sed -e 's/.*version \([0-9]\+\.[0-9]\+\).*/\1/g'`
 tcbold=4.39
 env printf '%% tcolorbox version: %s\n' $tcbversion
-- 
2.17.1


