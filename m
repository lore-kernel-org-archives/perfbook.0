Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FkKR8J0eCsYdpIONpE56IgX+4qzykty/NtvxRIbR8cE=;
        b=ponMh8ahvimFO9r+zJSpnfjwzsYrAXnt6v0EchjupQ0kHC1qI2oY7rqG2ujAvkIdYr
         a/SahderT53K1Ti7RvoE+RR40sPaQM6IcMxo0c5IY6FZNWXmUi03ucxBxhtw8e2/S/ev
         g8Xki0RTR5vupIdFbkcDxpL57OBo6/ydc1eG7rdPurK327tWj9XzkskA0v5NlMtpomXf
         XCNz0dBZrSzvy+RZS5NgVbIZqsVTG+/A7vzVm41ENrckwucQPyBPzZlQkKru5BWeWWgr
         5fGfXbdBv2hyPDJnFunHjOdMt5b1KwyaG7BEOVNH5nZL358MJ/Ub1OaE4B+uji3uvQ6+
         zHug==
Subject: [PATCH 3/3] formal/dyntickrcu: Cite git commits of dyntickrcu fixes
References: <1b15d6d0-55da-0fc6-67bb-0f30b4eb5fa9@gmail.com>
 <36421da6-4c59-597a-660f-f7ddf1d8835c@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <fe622fde-573b-24d2-2bd8-d16c88ec9da4@gmail.com>
Date: Tue, 9 Apr 2019 00:48:53 +0900
MIME-Version: 1.0
In-Reply-To: <36421da6-4c59-597a-660f-f7ddf1d8835c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From ce3017c2ee2b9b52501cc5d6f9bf896486fe6ac4 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 9 Apr 2019 00:07:18 +0900
Subject: [PATCH 3/3] formal/dyntickrcu: Cite git commits of dyntickrcu fixes

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/dyntickrcu.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index 0c09d1ce..2ba58cd3 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -1131,7 +1131,7 @@ This effort provided some lessons (re)learned:
 	In this case, the documentation effort located
 	a misplaced memory barrier in
 	\co{rcu_enter_nohz()} and \co{rcu_exit_nohz()},
-	as shown by the following patch.
+	as shown by the following patch~\cite{PaulEMcKenney2008commit:d7c0651390b6}.
 
 \begin{VerbatimU}
  static inline void rcu_enter_nohz(void)
@@ -1154,7 +1154,7 @@ This effort provided some lessons (re)learned:
 	This effort located one subtle bug in
 	\co{rcu_try_flip_waitack_needed()}
 	that would have been quite difficult to test or debug, as
-	shown by the following patch.
+	shown by the following patch~\cite{PaulEMcKenney2008commit:ae66be9b71b1}.
 
 \begin{VerbatimU}
 -       if ((curr - snap) > 2 || (snap & 0x1) == 0)
-- 
2.17.1


