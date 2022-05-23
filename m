Return-Path: <SRS0=VK2w=V7=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=aZKEjt4FwC8/dJekequ5UdtVs9Y8T3tcvinGnujNvfo=;
        b=MnPg9oRgdU1CNUSMA5GrDLhK0pBOfRWn+p6n52xowY6cA+Bp1t24aKDeUaki0YNfkj
         3AKTUT+ayUodkV//lMyMXNuHLm77JN7WLZnAOs8K3/WG9+DLf1TjHNAfT3ltexCTdXPa
         DGSLX8xI3liiPPJm22oyrFvqdD54SQkzZ/6Xg7plsxAahYj2jqKA5H50F3v5qRr/pvuG
         BhiJxC0gbaeXHnO/uCv2dPtkEBodYiXMsFyjZVb9rByuvc8PrKxZu+SQ5S6LRc76yMOf
         QE2ieZvloxfOSGvl957J95n7YyLmV8WNxomBKxsO3dm4Of5czxAIfdT55rRk8Zo+oTBK
         X5Og==
Message-ID: <1865d37a-ee66-97ef-87c9-8224d7dc0394@gmail.com>
Date: Mon, 23 May 2022 10:18:46 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 1/2] glossary: Capitalize 'Release store'
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Make it consistent with other terms.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 glossary.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/glossary.tex b/glossary.tex
index d488670d8b25..87db763b7be4 100644
--- a/glossary.tex
+++ b/glossary.tex
@@ -620,7 +620,7 @@
 	entity.
 	Reference counters provide existence guarantees and are sometimes
 	used to implement garbage collectors.
-\item[\IXG{Release store}:]
+\item[\IXG{Release Store}:]
 	A write to memory that has release semantics.
 	Normal use cases pair an acquire load with a release store,
 	in which case if the load returns the value stored, then all

base-commit: 3783abdc439f1652ec710ca2dabd99fc0fd65fca
-- 
2.25.1

