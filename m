Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=jzOWgCWtp0qqMh8NbWbP5thzm/P9zY/fFflhz7GLVBY=;
 b=cOdaOm2qGYWKJFfoqrI60ZOvmuHJGr+rPc2os3MagKeP7y7a2tPtTb4onTcjRxcQyb
 5slR4hb882duVEDzsUvP23hJhzwtUuORwnUVYecMGTwYVc+JRECAA6DFEBGxK2+eeTBt
 gtZ7XTpfBK5BMyePSOP7DZpfdKLHxv3h5XhjVBXs2q3bo/Lv5mDLG0uat+mrx6KuNJaG
 R7BPhH2474G6Es+zkw7Bmkk1fa20Rm81ddH/kSDkfIZkGkog9cYjTqzVqc2xEc6GQqCf
 KRTPGL4trY59TN014+Z1D6PsQ/IwUN8Qo+3BkZg5okG2dmMZ+mUsIaNOA9U6Fl9rfNSk
 11Bw==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH] memorder: Add a brief description of the use of multicopy
 atomicity
Date: Thu,  8 Nov 2018 10:21:31 +0800
Message-Id: <1541643691-8116-1-git-send-email-junchangwang@gmail.com>
To: paulmck@linux.vnet.ibm.com, akiyks@gmail.com
Cc: perfbook@vger.kernel.org, Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Subsection Multicopy Atomicity is ahead of Subsection Hardware Specifics where
implementation detail of multicopy atomicity in mainstream architectures is
presented. So we add (1) a brief description of the use of multicopy atomicity
in representative architectures and (2) a reference to Table Summary of Memory
Ordering, in subsection Multicopy Atomicity.

The description is borrowed from a nice discussion with Paul, which can be found
at https://www.spinics.net/lists/perfbook/msg01952.html.

Signed-off-by: Junchang Wang <junchangwang@gmail.com>
---
 memorder/memorder.tex | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index fba49b7..69ce196 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -1901,7 +1901,11 @@ Most CPU vendors interested in providing multicopy atomicity have therefore
 instead provided the slightly weaker
 \emph{other-multicopy atomicity}~\cite[Section B2.3]{ARMv8A:2017},
 which excludes the CPU doing a given store from the requirement that all
-CPUs agree on the order of all stores.
+CPUs agree on the order of all stores.\footnote{
+	As of late 2018, ARMv8 and x86 provide other-multicopy atomicity,
+	IBM mainframe provides fully multicopy atomicity, and PPC does
+	not provide multicopy atomicity at all. More detail is shown in
+	Figure~\ref{tab:memorder:Summary of Memory Ordering}.}
 This means that if only a subset of CPUs are doing stores, the
 other CPUs will agree on the order of stores, hence the ``other''
 in ``other-multicopy atomicity''.
-- 
2.7.4

