Return-Path: <SRS0=1fyB=E2=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694333082; x=1694937882; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iDbvC6/NSjGZPrxbzQFRno+0AaboPgTj0O7rskheBLE=;
        b=AdWsNgHZOzPH6nDNN0VgNQcM9vHFgO1oK8cO1APleJ4E0OQfxfNaTV+cgcYyVRQDFP
         u2pHStT3o2LvD7cycxB+xAxHBraFDrOEP/vcS5gASXpe17uDeepJ3w0/EEI6HXR0FAOL
         sZNcKtHg5iKUrYaa72KpS0z1Rsv6DX5mW1liAGec6DlQ96XhBXFnpWjsrilhDEx74GuX
         UNt6I9/4I1RH0M7TmRLKdzsq0jONGWx67pp1wyHQnJjfb8TF29tenopcHaYMzp9ub0h1
         8yJXDofTH7FC0zAR7KAhGx2vC7xOPU7dHoH9d6PzFhOxJq1huhfGr98AwlCiyEksgK+x
         /pWA==
Message-ID: <9f1664e3-61d4-de57-2adc-5d17d614b133@gmail.com>
Date: Sun, 10 Sep 2023 17:04:38 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook v2] memorder: Shrink ifthen.pdf in -1c and -eb
 builds
References: <a467db6f-c2ff-39bb-c606-cef301b8977e@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <a467db6f-c2ff-39bb-c606-cef301b8977e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

ifthen.pdf is tall and using \columnwidth makes it exceed paper
height in -1c and -eb builds.

.5\onecolumntextwidth (defined in preamble) gives reasonable size
figures in all layouts.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
v1 -> v2:
    Use \onecolumntextwidth for smaller figure in -2c builds.

Paul, this is a minimal change for fixing gitlab-ci error [1].

Figures 15.1 and 15.2 look unnecessarily large in -2c builds.
I'll tweak those figures as a followup change.

[1]: https://gitlab.com/linux-kernel/perfbook/-/jobs/5052273781

        Thanks, Akira
--
 memorder/memorder.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 947e09c9f885..6cf136b8dc6e 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -449,7 +449,7 @@ on
 
 \begin{figure}
 \centering
-\resizebox{\columnwidth}{!}{\includegraphics{memorder/ifthen}}
+\resizebox{.5\onecolumntextwidth}{!}{\includegraphics{memorder/ifthen}}
 \caption{If-Then Nature of Memory Ordering}
 \label{fig:memorder:If-Then Nature of Memory Ordering}
 \end{figure}

base-commit: 645f2734592176abc2f1eb87dcd1474b78ba9d2d
-- 
2.25.1


