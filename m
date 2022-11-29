Return-Path: <SRS0=caq+=35=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hY7hTy0j0QyVOP91oqgL1SpdzRzgtlSeNhm9GSG8gq4=;
        b=ePfbXP1RexPgcqlwkTs1oNmHNX10YXxg48UerF7WT9FHf8PgWA2BpuLjKJmVE+IBnj
         /QXForBdwuF/ILNt+9s9mde/7xwZywSLaffqwjhdJPj9ctL7n4lqzhPnRpN8AHpgCmon
         qWO7VSb9MonuAyIiRK/+fv1nyzOeC3uMxSc4qKhjgZhJVQ+6/qKAA3IOaKo+/uHVEUVS
         MP8+JTbxX94VkBOnc9CdRClK+vb8vg1JAz/+MNzFl52+GnU/MzaGJJyIHy4zuL9UUQVO
         lcYoegOvVSx7KR8HNNbXgyFE3VgrorenfxNUUM1Z+u+eecAWltJlntTLFVtEkYqbwSo5
         301g==
Message-ID: <8db36786-c3da-66ac-2160-77df121c4cc5@gmail.com>
Date: Tue, 29 Nov 2022 23:46:24 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] SMPdesign: Fix typo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

"... due to the fact that is uses only global locks." doesn't make sense.
The "is" looks like a typo of "it".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 SMPdesign/SMPdesign.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
index 70936c12ce7e..f8a1b289bb8f 100644
--- a/SMPdesign/SMPdesign.tex
+++ b/SMPdesign/SMPdesign.tex
@@ -175,7 +175,7 @@ int hash_search(struct hash_table *h, long key)
 \subsection{Code Locking}
 \label{sec:SMPdesign:Code Locking}
 
-\IXh{Code}{locking} is quite simple due to the fact that is uses only
+\IXh{Code}{locking} is quite simple due to the fact that it uses only
 global locks.\footnote{
 	If your program instead has locks in data structures,
 	or, in the case of Java, uses classes with synchronized

base-commit: 5e6242b1bd3952817b24ccd6d477cc1dadd90639
-- 
2.25.1

