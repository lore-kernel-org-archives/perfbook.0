Return-Path: <SRS0=QZ2n=I2=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Q9h6TFVpA9vRGN/sM7Fx5zY9mRaEWzJcu4QJXN+Q0vg=;
        b=UTG9cSZuqt4DrJhXk+Y1wM9kSmhPZBgWMDD3UxGdUPxN5T/eWD5qmG/o3tm3umCjnk
         VxpiSzRyr0E8QK8xe7C2Nl+x5ZysIYVsOcm1QDyEVJaFz1vYHDQOg9jUWeUH4F9DoNmc
         Y5kZkmMWpcHMgHPZBFG3iwZHbkwoRSeaWy22ufA3czchaeGs+5Mk+dLdgXKQqtUBcIB0
         QNQeYW7a/mvQadn6kt0gkrHh7ROzYLqnjttoJAMsLqRTzk0bvL2RxzI4qvUo6iBFyp+8
         yQb1qZZwdUoVKWnpMxXpGTyzyMmRKiFBq5ovHahWZ29rJDsUTSOjBIgOMmcbH61IKg+V
         Dfmw==
Subject: [PATCH -perfbook 2/5] runlatex.sh: Catch warning from makeindex early
References: <d63ba139-abc7-3837-b44a-294a48a1b216@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5bd46925-cde3-3386-4ff9-619f4a038707@gmail.com>
Date: Sun, 28 Mar 2021 17:53:25 +0900
MIME-Version: 1.0
In-Reply-To: <d63ba139-abc7-3837-b44a-294a48a1b216@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Better to fail early than to notice later by inspecting index pages.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/runlatex.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
index 2779cf68..5c7db65a 100644
--- a/utilities/runlatex.sh
+++ b/utilities/runlatex.sh
@@ -66,6 +66,11 @@ exerpt_warnings () {
 iterate_latex () {
 	makeindex $basename.idx > /dev/null 2>&1
 	makeindex $basename-api.idx > /dev/null 2>&1
+	if grep -q '## Warning' $basename.ilg $basename-api.ilg
+	then
+		echo "----- Warning in makeindex, see .ilg log files. -----"
+		exit 1
+	fi
 	pdflatex $LATEX_OPT $basename > /dev/null 2>&1 < /dev/null || :
 	if grep -q '! Emergency stop.' $basename.log
 	then
-- 
2.17.1


