Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=QBNfs6bMq/cfokwVQbGlbaQnvrRE4RmLD+SDsBebKVw=;
 b=Y0tipW9vP5SZJTBVhc8KqlYRtO1mlG2TPCCyQuGr0xRWZvt6aAMR2PZCnC7lrUKepu
 sKONMDRzEw9LNzvMQdQqPA4su1GkFwkxPBgr6GlWWzrl2IdE/jUYZ4ezTJR1bQlsxko6
 FIWZWNHj0pdLwy3RE/uMlOCt/ajb5pXWL2sqr4SpzQ49gM9K0N/+f+97KbKKESy/EsHP
 qlbdnSbgBeeqav19Rt4gqSg/3FwRGmLdjMXic41knUtJZcsljxfCsdhcqZz9Ia9scA/H
 bd5ERKQm1uwHGpfTryC93HH14KRWrkpClTltJWSTs2GFeIG8O2VjWElf0RbAz+G0eXdo
 59Pg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 1/5] memorder: Add missed comma
Date: Tue, 17 Oct 2017 11:20:50 +0900
Message-Id: <20171017022054.32680-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 memorder/memorder.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 8a3da54..e911e79 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -4064,7 +4064,7 @@ in Alpha's heyday.
 One could place an \co{smp_rmb()} primitive
 between the pointer fetch and dereference in order to force Alpha
 to order the pointer fetch with the later dependent load.
-However, this imposes unneeded overhead on systems (such as ARM
+However, this imposes unneeded overhead on systems (such as ARM,
 Itanium, PPC, and SPARC) that respect data dependencies on the read side.
 A \co{smp_read_barrier_depends()} primitive has therefore been added to the
 Linux kernel to eliminate overhead on these systems.
-- 
2.10.0

