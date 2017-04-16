Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8bSIvUqqpgKacWbO6zCI8RVuGlAaf+GOcgQG9etP+X8=;
 b=DRG32Dbh22NDNTHk9WJ5KrWPj8KOwmOvDqo+cmPjK/Kg5PFDTK6hiMWjYAySuPfSuA
 Wp0OtUCJg1QE8PGSMA3MtJeNeNy159wbrI1OmcWbNcfOnkj7jK3hObvIaG2lgOlYDfEM
 qao+pSCQdyoGjxkqD+Cd0CvbsYXVYidQyTZpfbrwj8b/cT0MgD0QgKOeKUIr87ckW/jq
 SwBugQMzXZkfyQ9lpoHNFjHpwsmwVAWgK45V4VJMTkK+ubhQS/HRz9sDPHd+faN+6xA2
 Pefme7ADyra2Rgo7mdNepv1+6gDmu67jHQpqUGPWvPBRI8kCMlOvNp0TAkBxuIeAZbJW
 +yyg==
Subject: [PATCH 07/14] advsync: Avoid indent after minipages
References: <be8c3cb5-9ee2-9f60-bfcd-e729389304f9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b3fca24b-ea41-4f9d-cc88-7133c0646c05@gmail.com>
Date: Mon, 17 Apr 2017 07:19:49 +0900
MIME-Version: 1.0
In-Reply-To: <be8c3cb5-9ee2-9f60-bfcd-e729389304f9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From b987758d115a7260e9ff8f7453c69a6e6bc9768b Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 16 Apr 2017 08:11:14 +0900
Subject: [PATCH 07/14] advsync: Avoid indent after minipages

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 270c868..8173684 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -1186,9 +1186,9 @@ denoted by ``st'':
 	st B=4, & ... & & \\
 	... & & & \\
 \end{tabular}
+\vspace{3pt}
 \end{minipage}
-\vspace{5pt}
-
+%
 and can thus result in four different combinations of local values:

 \vspace{5pt}
@@ -1263,9 +1263,9 @@ be used:
 *A = 5;
 x = *D;
 \end{verbatim}
+\vspace{1pt}
 \end{minipage}
-\vspace{5pt}
-
+%
 but this might show up as either of the following two sequences:

 \vspace{5pt}
@@ -1275,9 +1275,9 @@ but this might show up as either of the following two sequences:
 STORE *A = 5, x = LOAD *D
 x = LOAD *D, STORE *A = 5
 \end{verbatim}
+\vspace{1pt}
 \end{minipage}
-\vspace{5pt}
-
+%
 the second of which will almost certainly result in a malfunction, since it set
 the address \emph{after} attempting to read the register.

-- 
2.7.4


