Return-Path: <SRS0=yiI0=SF=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=DedRkns/Ebj8oSWUIAw7BnWNCKK42VB6y956pZ/5PKY=;
        b=gM9DiJ28s9G2kpSHs4etMR5ZdU0VlWHt9pgM8Pzv0rf730WSTMgpl2G2yEa/lQCwjd
         P+UPlyzmSviRXvCEoGoeAKjDtJgKzJrqjNOtAy6NSANqfHM5/lmFEcV8ZK/bgBLAggjK
         8mqL7H+S0lewCit8d0QA6jRVN4/mw5oEs/gUySHnyx88QX+/XGZ0ya7jp0jFh9MMIV/0
         uvoMzbWLH11sYz5FF6bcW0c8wruDFYrknGQ+YFMUF1bnHQX0VP/FCDmKWECTOite52mG
         TIdaK+OtPz7F2HlfnmITYUPmJjNlrZjMVrpW/dfpyBYsgs8DmjyELHQYix6s2IEta8+S
         vkug==
Message-ID: <9d07bd21-9988-9b1f-d7f1-c7dae07d7a51@gmail.com>
Date: Fri, 21 Jan 2022 22:32:13 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] bib/perfmeas: Fix doi of McKenney99b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>, Zhouyi Zhou <zhouzhouyi@gmail.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Escape sequences of "%3C" and "%3E" in doi cause a build error when
"inlinelinks" option in alphapf.bst is set #0 (URLs explicit).

Fix the error by using non-escaped symbols of "<" and ">" instead.

Fixes: 62c6a33781d9 ("bib: url/doi updates")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Zhouyi,

Prompted by your patch "RFC: make some bibliography items better",
I tested an option in alphapf.bst (bibliography style file of
perfbook), namely "inlinelinks".
By setting "#0" to inlinelink (URLs explicit), URL and DOI info
in .bib files should be printed in Bibliography.

However, the build failed with McKenney99b.

This patch should fix the build error.

You still need to manually edit alphapf.bst, but please try
setting "#0" to inlinelink.

As you will see, if a bibliography has DOI info, URL info in
the note field is redundant when the URL is the one reachable
via the DOI.

        Thanks, Akira
--
 bib/perfmeas.bib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bib/perfmeas.bib b/bib/perfmeas.bib
index 9ba80cfc..51f63bb7 100644
--- a/bib/perfmeas.bib
+++ b/bib/perfmeas.bib
@@ -83,7 +83,7 @@ Machine Language Rewriting",
  year = {1999},
  pages = {219-234},
  bibsource = {DBLP, http://dblp.uni-trier.de},
- doi = {10.1002/(SICI)1097-024X(199903)29:3%3C219::AID-SPE230%3E3.0.CO;2-0}
+ doi = {10.1002/(SICI)1097-024X(199903)29:3<219::AID-SPE230>3.0.CO;2-0}
 }
 
 @Book{Menasce94,

base-commit: cd891db680ae978f5efa362cbdc074483f07042a
-- 
2.17.1

