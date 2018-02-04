Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=glXEH7IJyMqoOsfq/eJzUwXUyThMwfR9vdLcBsV/dTI=;
 b=ugj/DgAz0bnzZYW2087Dltvd2SDvpp9gAkt57dKD/ojXrAFbXOCv61TmYsyJHq5azW
 uxxEoqBlRetXwlBj6TDRa7MYQElO1YLoJJsTwLRfRzzYypE3HvLs1G/Cllp9FLrFGu4q
 gOJVjaqadYegKZaeUIu+BICk3ptS95QuirGDoIPrWyvGuV+1BHrryZ37RjUlY5+YieiQ
 gUeJgkKmR/DhKuq/NdqB7ZX0JxhHiOPW6Fb8lO+dD7f1gUZjrZYuYukXib9CMUJOKNOL
 pCQd6g2r1Cw9RYuJvdcMMU+0ye9vhWVlBbr8zGAgDsDlLf01PmQ7dh/VcDZQAf4f0+DR
 JMWQ==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 2/2] toolsoftrade: Use `\path{}` for filename
Date: Mon,  5 Feb 2018 07:11:35 +0900
Message-Id: <20180204221135.1001-2-sj38.park@gmail.com>
In-Reply-To: <20180204221135.1001-1-sj38.park@gmail.com>
References: <20180204221135.1001-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

A file name in toolsoftrade chapter is using `\co{}`.  This commit fixes
it to use `\path{}` instead as 'Style Guide' chapter mentions.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 toolsoftrade/toolsoftrade.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index ac25855..1ac7a34 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -107,7 +107,7 @@ grep $pattern1 | sed -e 's/a/b/' | sort
 	For a sufficiently large input file,
 	\co{grep} will pattern-match in parallel with \co{sed}
 	editing and with the input processing of \co{sort}.
-	See the file \co{parallel.sh} for a demonstration of
+	See the file \path{parallel.sh} for a demonstration of
 	shell-script parallelism and pipelining.
 } \QuickQuizEnd

-- 
2.10.0

