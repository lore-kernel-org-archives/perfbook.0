Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=q0CoS6roPSOL0JrykQ2txNu6qE+USmsExFFmujm0o3s=;
 b=HwoHRYMjFmPdELkr2mgjDNQUKOR4c80xd/qGa+gXceQ5GwQeMdVEBvWRlIBat2H3K1
 g0DijjzgWdJkKT72uCalq5Z7O9kaCs2+l6Y7y1jtjCBbBtV5/Hp30aWUo6fiLZVzUr13
 wkSFIl1J38xcmCdNamTasVHQ/zFGJU4sp1+Bzle5IQv0rszhjYrcnb2B5eSrRSa16/gC
 nRQtFU3JcGV/Ds0kKNE8kRX5NU1MIV168I9BjiEjSePxqdgG9gllUuQDhzTJ7qsNI4LJ
 1ge2r2w3jFv0yLxzvsPBOD871S9/uOtyhaYZu3FOksIYaVdgxZm5ilUM9ySHof7u2TNY
 90mg==
Subject: [PATCH 1/2] bib/hw: Replace UTF-8 encoded single quote with plain
 ASCII
References: <2fba7d76-719e-8947-cbc0-ee25040f84f1@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <80d5f78b-5abe-ea1c-73c0-dd96af99ff98@gmail.com>
Date: Wed, 18 Jan 2017 00:23:24 +0900
MIME-Version: 1.0
In-Reply-To: <2fba7d76-719e-8947-cbc0-ee25040f84f1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From c7ecda7f94d6297c257220d97311a9524deb3cf6 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 8 Jan 2017 09:28:40 +0900
Subject: [PATCH 1/2] bib/hw: Replace UTF-8 encoded single quote with plain ASCII

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/hw.bib | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bib/hw.bib b/bib/hw.bib
index 7e4fcd6..b535bdc 100644
--- a/bib/hw.bib
+++ b/bib/hw.bib
@@ -424,7 +424,7 @@ Set Reference Manual"
 }

 @manual{Intel64IA32v3A2009
-,title="Intel 64 and IA-32 Architectures Software Developer’s Manual,
+,title="Intel 64 and IA-32 Architectures Software Developer's Manual,
 Volume 3A: System Programming Guide, Part 1"
 ,organization="{Intel Corporation}"
 ,year="2009"
@@ -435,7 +435,7 @@ Volume 3A: System Programming Guide, Part 1"
 }

 @manual{Intel64IA32v3A2011
-,title="Intel 64 and IA-32 Architectures Software Developer’s Manual,
+,title="Intel 64 and IA-32 Architectures Software Developer's Manual,
 Volume 3A: System Programming Guide, Part 1"
 ,organization="{Intel Corporation}"
 ,year="2011"
-- 
2.7.4


