Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680975209;
	bh=LRqooCZ6ucyddBkVmDnpMhv00BEZNnBTJT2kJLp0fPg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YMQZeIO0h8nVOaGpwYhAzp4ibI+dmO7UM4HzqdDheZGL9nQk3AroI+zYj+1mE3cFV
	 fbkeLZVxes2ZVIjksgf6r3nDpoI69ibzBvkih5lfrmm1pMVibzIUtruJh+gnRGjdNR
	 07bYRLj/V6xMWxe4nETECtDJlun8BQPG16/GVmSUFqa9Ej1QyXEbgDTJWrNJPdFggu
	 IVMYKtGCjzvd5d0jx/WA4DjSb9EiIudcIlI4utoNap/J69PO6G9VmuDh1kWJ7VZwZQ
	 WqfKfA65QdYxJoJ4EmOxxp1tfNYwa8Wc8HPqoiI3oFpjMefrXjL3IWt+H2WciG6b/B
	 FcmuRnS3jYhXw==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 02/12] formal/spinhint: Use \qco{} instead of ``\co{}''
Date: Sat,  8 Apr 2023 10:32:59 -0700
Message-Id: <20230408173309.5543-3-sj@kernel.org>
In-Reply-To: <20230408173309.5543-1-sj@kernel.org>
References: <20230408173309.5543-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

A few sentences in spinhint.tex are using ``\co{}'', which can be
shortenized with \qco{}.  Use the shorter one.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/spinhint.tex | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index afdd275e..0371f570 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -275,7 +275,7 @@ Given a source file \path{qrcu.spin}, one can use the following commands:
 	10.5\,GB of memory even with the \co{-DCOLLAPSE} flag.
 
 	If you see a message from \co{./pan} saying:
-	``\co{error: max search depth too small}'', you need to increase
+	\qco{error: max search depth too small}, you need to increase
 	the maximum depth by a \co{-mN} option for a complete search.
 	The default is \co{-m10000}.
 
@@ -325,7 +325,7 @@ Promela will provide some surprises to people used to coding in C,
 C++, or Java.
 
 \begin{enumerate}
-\item	In C, ``\co{;}'' terminates statements.
+\item	In C, \qco{;} terminates statements.
 	In Promela it separates them.
 	Fortunately, more recent versions of Spin have become
 	much more forgiving of ``extra'' semicolons.
@@ -582,7 +582,7 @@ cc -DSAFETY -o pan pan.c
 
 The output will look something like that shown in
 \cref{lst:formal:Output for Spinlock Test}.
-As expected, this run has no assertion failures (``\co{errors: 0}'').
+As expected, this run has no assertion failures (\qco{errors: 0}).
 
 \QuickQuizSeries{%
 \QuickQuizB{
-- 
2.17.1

