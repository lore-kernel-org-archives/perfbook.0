Return-Path: <SRS0=XIzw=CZ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688732002; x=1691324002;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eYsTIbRVQtP7JK8NLiKcA9aQ2c9eUA5+sbO1pxbz+FQ=;
        b=cZzFLzewb1cvLPMREDmBGuDfvoEpH+WLEtiylrVgvbW5fzSGOwQBieQcwep7XUiNeB
         NbKhiLSoMjpnMeu0IjqaANeeqzAj+qhTCwVTy1IPQiGlbOw5ZIfEPy57X1SIt6R2V7gT
         opSXCNSem86hKexV65xHDaFVcDztKX8QP+d6lh0mQEzg2ykWHXnTENlmYWn/Gmn+UC9v
         DuG7mt/Qoy0b6dLac/v5dedML1GuhHO2DkBu5u81RQbNynUUsDvQ8Y7VRz16HpEJv7ww
         xLVk2Na5tbOvv653wjDMKy9UPu6ppj1WaxJdLbnKmsxXnktSz7EcmvzoruTok77b3OGz
         O47w==
Message-ID: <ec912179-8877-74fc-77d8-ab275d3b60d4@gmail.com>
Date: Fri, 7 Jul 2023 21:13:19 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 6/7] runlatex.sh: Fix typo (exerpt -> excerpt)
Content-Language: en-US
References: <fcac2844-3c91-c6d1-d921-5402eead1cfc@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <fcac2844-3c91-c6d1-d921-5402eead1cfc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/runlatex.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
index b146da20559f..dd62327a0b4d 100644
--- a/utilities/runlatex.sh
+++ b/utilities/runlatex.sh
@@ -53,7 +53,7 @@ identical_warnings () {
 	return 1 ;
 }
 
-exerpt_warnings () {
+excerpt_warnings () {
 	if grep -q "LaTeX Warning:" $basename.log
 	then
 		echo "----- Excerpt around remaining warning messages -----"
@@ -123,7 +123,7 @@ do
 	if test $undefined_refs
 	then
 		echo "Undefined refs remain, giving up."
-		exerpt_warnings
+		excerpt_warnings
 	fi
 	if identical_warnings
 	then
@@ -145,7 +145,7 @@ do
 	echo "$LATEX $iter for $pdfname # label(s) may have changed"
 	iterate_latex
 done
-exerpt_warnings
+excerpt_warnings
 rm -f $basename-warning.log $basename-warning-prev.log
 echo "'$basename.pdf' is ready."
 # cleveref version check (Ubuntu 18.04 LTS has buggy one
-- 
2.25.1


