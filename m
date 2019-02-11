Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vefaEiBGt/7lwp+0ItPxyvxSfnqHBsDLWflFgrijepw=;
        b=qZh7oWjsOG9kR8dTXyEHdz7tbAbDr/sdoWp/U2POFF6z7wPte3vimOqpFBeH7okgCB
         3+cfYqEb4bLs3yEFktzFg5fqfFvaGAgJM+EYiCSZAQ/V8FeA7xsyyjXycbueyia+2Rp/
         vgcVwNqqlxLiVNdU78HmOs5XU8ValQzD2bEw6SMNrq4y1P0hSYfEfZLUSfy0dqVgO6yy
         BoxQhjalG5XE4SGLOdceA9UDQ62ByCFpJJbmmOTVzyM8ir7dOR+L72+6t97y1zUvqVSn
         OJr5ewlXyP0UfAVfS9XVgGcvXYsBA3cEpLoofx7iw+TLQst/FeQUAUXaRNitUJ//c01E
         4AeA==
Subject: [PATCH 2/3] formal/spinhint: Add column of search depth in Table 12.2
References: <db974b96-dd4f-dce2-44a5-1b33f5ed495e@gmail.com>
 <20190202173437.GO4240@linux.ibm.com>
 <d48a0e7f-6869-86ac-6edf-a47c33cdaeb7@gmail.com>
 <20190207091757.GE4240@linux.ibm.com>
 <152110af-bf63-2b7b-d48a-52484589de9d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <c7a17586-0807-f0cc-ff5e-207d9f70a277@gmail.com>
Date: Tue, 12 Feb 2019 00:12:26 +0900
MIME-Version: 1.0
In-Reply-To: <152110af-bf63-2b7b-d48a-52484589de9d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 5c56bad538021adfb91fbb6b65ff0b5544f4e849 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 11 Feb 2019 08:44:25 +0900
Subject: [PATCH 2/3] formal/spinhint: Add column of search depth in Table 12.2

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/spinhint.tex | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index bbbaa10..deddbbc 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -856,26 +856,27 @@ cc -DSAFETY [-DCOLLAPSE] -o pan pan.c
 \begin{table}
 \rowcolors{1}{}{lightgray}
 \renewcommand*{\arraystretch}{1.2}
-\small
+\footnotesize
 \centering
 \begin{tabular}{S[table-format = 1.0]S[table-format = 1.0]S[table-format = 9.0]
-		S[table-format = 5.1]}
+		S[table-format = 6.0]S[table-format = 5.1]}
 	\toprule
 	\multicolumn{1}{r}{updaters} &
 	    \multicolumn{1}{r}{readers} &
 		\multicolumn{1}{r}{\# states} &
-		    \multicolumn{1}{r}{MB\footnote{
-			Obtained with the compiler flag \co{-DCOLLAPSE}
-			specified.}} \\
+		    \multicolumn{1}{r}{depth} &
+			\multicolumn{1}{r}{memory (MB)\footnote{
+				Obtained with the compiler flag \co{-DCOLLAPSE}
+				specified.}} \\
 	\midrule
-	1 & 1 &         376 &    128.7 \\
-	1 & 2 &       6 177 &    128.9 \\
-	1 & 3 &      99 728 &    132.6 \\
-	2 & 1 &      29 399 &    129.8 \\
-	2 & 2 &   1 071 181 &    169.6 \\
-	2 & 3 &  33 866 736 &  1 540.8 \\
-	3 & 1 &   2 749 453 &    236.6 \\
-	3 & 2 & 186 202 860 & 10 483.7 \\
+	1 & 1 &         376 &      95 &    128.7 \\
+	1 & 2 &       6 177 &     218 &    128.9 \\
+	1 & 3 &      99 728 &     385 &    132.6 \\
+	2 & 1 &      29 399 &     859 &    129.8 \\
+	2 & 2 &   1 071 181 &   2 352 &    169.6 \\
+	2 & 3 &  33 866 736 &  12 857 &  1 540.8 \\
+	3 & 1 &   2 749 453 &  53 809 &    236.6 \\
+	3 & 2 & 186 202 860 & 328 014 & 10 483.7 \\
 	\bottomrule
 \end{tabular}
 \caption{Memory Usage of QRCU Model}
-- 
2.7.4


