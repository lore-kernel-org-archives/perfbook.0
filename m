Return-Path: <SRS0=Bw3l=JL=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7vhDWAWJWXaX5Pyx9Xkw1TMZKuPKmsb5i+FFmRVKByU=;
        b=YRJmwP/rWNQjiDAfHSNSI6hBAblHVx9eZJz02Ewz6IQrJOx7q9zRfLs7x/YJNXXQNl
         dV0SXHOdFa1jr7ANFVJeLN0ccNcOQn9Aot3UWoD4yFh0jJYW3z5a7F1nXmtLnnHirVEA
         1r+98kOrJv6AEk+SWP3esHUYls0E5xP8GTk0pQpJ3SkBrptEeLrbHHzUZQyu47IlLGDf
         MfLGKns3HNRsCSQYEUq8iEtb2Q8nq4D9J9Lp/Jq6S6WYCAHAOXT1TI4OpJfWs5EmDC0W
         T9wxTptO5TDDjD3VvNoyhbOZDsBoNhEpPK03zqwDF1DyBeuN8XEtWmFU9OE4BB9tfnL5
         1zYA==
Subject: [PATCH -perfbook 4/5] howto, Makefile: Update answer to Quick Quiz
 1.3 and 'make help-full'
References: <b1bb1f84-9195-33ab-b6d1-ac68be1dca84@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a06bd813-4dbe-819f-8faf-e4da3e11676d@gmail.com>
Date: Wed, 14 Apr 2021 20:11:01 +0900
MIME-Version: 1.0
In-Reply-To: <b1bb1f84-9195-33ab-b6d1-ac68be1dca84@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Now chapter-wise sections contain Quizzes only.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile        | 2 +-
 howto/howto.tex | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 1d26cfbb..4beb2c17 100644
--- a/Makefile
+++ b/Makefile
@@ -520,7 +520,7 @@ help-semiofficial:
 	@echo
 	@echo "Semi-official targets:"
 	@echo "  Full,              Abbr."
-	@echo "  perfbook-nq.pdf,   nq:   2c without inline Quick Quizzes (chapterwise Q&As)"
+	@echo "  perfbook-nq.pdf,   nq:   2c without inline Quick Quizzes (chapterwise Qs)"
 	@echo "  perfbook-sf.pdf,   sf:   2c with sans serif font"
 	@echo "  perfbook-sfnq.pdf, sfnq: sf + nq"
 
diff --git a/howto/howto.tex b/howto/howto.tex
index 42e3d626..74bbed4c 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -226,8 +226,7 @@ Here are a few possible strategies:
 	produce a \co{perfbook-nq.pdf}.
 	This PDF contains unobtrusive boxed tags where the Quick Quizzes
 	would otherwise be, and gathers each chapter's Quick Quizzes
-	and their answers at the end of that chapter in the
-	classic textbook style.
+	at the end of that chapter in the classic textbook style.
 \item	Learn to like (or at least tolerate) the Quick Quizzes.
 	Experience indicates that quizzing yourself periodically
 	while reading greatly increases comprehension and depth
-- 
2.17.1


