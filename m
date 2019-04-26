Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ejQkYYc8+bV8LOWaqZHHQWpFcx69B23TrtVNzI5h7yg=;
        b=kesbfjd7oOwoC1XgE9a7YAiUekKobKkRymrvLgrv+bDg3xFTbiNuqEjjwUCkQ8b13S
         JZ9EsY/qzU5B+X6vlQ0DLBLbKHzUe+KOwsp9O++6nEYQJJ2Uk3zO6LLxfj9SzhUQBSRr
         K1wiUJLXTTBXpKPaxAkZMyvI+jxNxvGCI6nWl3YfsjHJWoxH/0CldNZdyOOOudFylxTO
         3gLIzoLPypBVV3JE3iVUBdIBFYa5KgCAsQ70kBcO97poZZb3HwC5mMyk358R+EOEdRue
         Z6ILooZ4OftLIxug34IsB6xPgeo4ZKQRhmckjw44PN/gro6h+hNvq/QHfLRfjnpxQNV7
         KqPg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 5/5] defer: Use 'Go' instead of 'golang'
Date: Fri, 26 Apr 2019 09:57:04 +0900
Message-Id: <20190426005704.10952-6-sj38.park@gmail.com>
In-Reply-To: <20190426005704.10952-1-sj38.park@gmail.com>
References: <20190426005704.10952-1-sj38.park@gmail.com>
To: paulmck@linux.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

'golang' is an abbreviation for 'Go programming language'.  Thus, the
term 'golang programming language', which is used in the 'defer' chapter
has unnecessary duplication.  This patch modifies the sentences to use
'Go' instead of 'golang' in general.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 defer/whichtochoose.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
index a0af68f..15df46a 100644
--- a/defer/whichtochoose.tex
+++ b/defer/whichtochoose.tex
@@ -493,9 +493,9 @@ QSBR and epoch-based reclamation
 both of which are types of implementations of RCU.
 
 Sheth et al.~\cite{HarshalSheth2016goRCU}
-demonstrated the value of leveraging golang's garbage
+demonstrated the value of leveraging Go's garbage
 collector to provide RCU-like functionality, and
-the golang programming language provides a \co{Value} type that can
+the Go programming language provides a \co{Value} type that can
 provide this functionality.\footnote{
 	See \url{https://golang.org/pkg/sync/atomic/\#Value}, particularly
 	the ``Example (ReadMostly)''.}
-- 
2.10.0

