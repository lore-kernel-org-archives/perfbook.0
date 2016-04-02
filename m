Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZBorU0/PGF6HcZLxNqSsQgYW1+NE9bpgl+zDf+8ZMr0=;
 b=aar/JXjUjh3KTgS2VSCXfAsy1MITA2VgaNHSraSqKLmjIy2rwcR6QGfbujZORn+Z5n
 i6TtyVeF3JnZABN6sqbqFf6sO6Faa7UlHEXrD8ayRuuCjuzXiiCarTYBrYaMpJPdOE0j
 t77E07HEfEpdiewDds742P6k71q5SBMrQHGqk+syICt/fuKM5j9Wfn8FXvJ7Joklt5fi
 /9F446nK40Af2uQPzVk6eQfdsgtcohJ2mfInww2jKj+cJUA5P3QQCM+y3mMBqymPNCyk
 3+SgatrMMuAE0+DfodmRALNuhiK5jVHagpb8voJBPlEbU5dvV+t2mZK5q/6/VjJjxQ2C
 u67Q==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 4/6] advsync: fix wrong code example
Date: Sat,  2 Apr 2016 09:28:29 +0900
Message-Id: <1459556911-11538-5-git-send-email-sj38.park@gmail.com>
In-Reply-To: <1459556911-11538-1-git-send-email-sj38.park@gmail.com>
References: <1459556911-11538-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: dhowells@redhat.com, perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

The code means `Y = *(A + 4)` but it is written as `Y = *A`. This commit
fixes the typo.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 advsync/memorybarriers.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index ee9312d..b1f49d3 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -1364,7 +1364,7 @@ Y = LOAD *(A + 4); X = LOAD *A;
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
-*A = X; Y = *A;
+*A = X; Y = *(A + 4);
 \end{verbatim}
 \end{minipage}
 \vspace{5pt}
-- 
1.9.1

