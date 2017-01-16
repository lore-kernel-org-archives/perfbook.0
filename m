Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=vGSAo6A5lvvNmnnAyjkPco3NNBEWzthyoy/N450mfxM=;
 b=LIsH4s16n1K9CjYFPyD0QWqXrS5I58KyuKrnPU+obbcnDDwytmXByE75cIsLQFdtO4
 BgMYF/nLtQM17lTHNjGRz086MwOdS+nPLV7bc0LZufooVITWzEgyyVeYLyRpzgZFbETA
 4uowSENEpvnTljrWmn4HcZt8QvkKHl0oI6GKjmPn3kuJD14TRz6AvW7LGe7M7+rH4ZdA
 buSOzacnzAObIzZ7z7GtkQNNaTDTtYsyrXFQw1LQNLgP2tmkwpGH5xahSBQ37yoQLXhv
 K4TWv9fgqMGTcRjCXsgIEmhuYkcTyxi+KljGk9Ie1XVkh2ANpTACuFbHD7gdnNnC27ER
 Cnug==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 1/2] glossary: Use proper quotation marks
Date: Tue, 17 Jan 2017 01:09:05 +0900
Message-Id: <20170116160906.22579-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 glossary.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/glossary.tex b/glossary.tex
index 6e4a83798a3d..4dde152979f0 100644
--- a/glossary.tex
+++ b/glossary.tex
@@ -233,7 +233,7 @@
 	expect~\cite{AndreasHaas2012FIFOisnt}.
 \item[Lock:]
 	A software abstraction that can be used to guard critical sections,
-	as such, an example of a ''mutual exclusion mechanism''.
+	as such, an example of a ``mutual exclusion mechanism''.
 	An ``exclusive lock'' permits only one thread at a time into the
 	set of critical sections guarded by that lock, while a
 	``reader-writer lock'' permits any number of reading
-- 
2.10.0

