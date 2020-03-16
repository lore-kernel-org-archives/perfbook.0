Return-Path: <SRS0=Y4Pl=5B=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=I7cBvuroRN+W/FGYQGH+blc+cj6ZKhE1H7lIOuPqB+c=;
        b=CduFwBVCNXsFBUvVM61uo6ScnTz+nuwe20+6/LrsnsU7GB+Er/ZMLFhvdWNFnqK0Gr
         NmpwtU5x/HoSDz6rFg6EkH94V8v82BTzDKhjlXDE6gccYcyno6GxQzf1WqgMEWGxNYt1
         g2JN4vI856OII9YP7larr+PHmR2x0QUrgNWQCktg8i60XGKKBUyYfnTRxxxC4BZzVeH2
         jxuK9ltDc6FVKvpubxC+js93WamX9fFyFmDDdyltGRohiNhYKNbRv+fVzFIod83uj0li
         MVguvsEiznbvicVbVGTfnAKwHEROoqlfTDBWcu49TJT0e7I3pC4DavtVwxCqJcOId0YG
         R7Gg==
Subject: [PATCH 2/3] intro: Use 'VerbatimU' env for command output
References: <70bc6ef5-e823-ae3f-7753-169ba1190d5f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <9918cdb4-1c55-9995-75c6-6d0fe92234ed@gmail.com>
Date: Tue, 17 Mar 2020 00:17:28 +0900
MIME-Version: 1.0
In-Reply-To: <70bc6ef5-e823-ae3f-7753-169ba1190d5f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 30b7576e4db9f6125a8c516b7efc2adc016e259d Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 9 Mar 2020 20:24:22 +0900
Subject: [PATCH 2/3] intro: Use 'VerbatimU' env for command output

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 intro/intro.tex | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/intro/intro.tex b/intro/intro.tex
index d2be90a2..ac00f282 100644
--- a/intro/intro.tex
+++ b/intro/intro.tex
@@ -216,7 +216,9 @@ programming.
 	Finally, on Linux and UNIX systems, consider the following
 	shell command:
 
-	{\small \tt get\_input | grep "interesting" | sort}
+	\begin{VerbatimU}
+	get_input | grep "interesting" | sort
+	\end{VerbatimU}
 
 	This shell pipeline runs the \co{get_input}, \co{grep},
 	and \co{sort} processes in parallel.
-- 
2.17.1


