Return-Path: <SRS0=QZ2n=I2=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0yUHztoVssfYQ7VcoVvP5BrfU1/irbuQm189MfTt6aY=;
        b=h34oDeoNBQzB+zCjAM7thF0QN1ztHdG3RSJbb2ePCc4EooQO3q5Frx5GiJnEISWxgd
         uJyly9MhkM587xfzkBpCb/hYG7NTGqNm3FLRrBc+t6XT5dabOFItl4GELBKte/GTfKrX
         UWwROjVjQMFLn7hK9PKWQxcQVM9gjMk7qKTwQpr73t4jR+lno/vbM12Kx8ALfSbMNqQQ
         IoITN0k4CgEdwW97zuizDmx6dsGXqmfMh5zEp/IKrk/HWEJGKk8lWTVbWE+ed+anHQxv
         4m7ERzzKV8QDV1qaH8L0vCboitp73JY4xABlPBkOCU4M9yt9yYN7EIz3sER0tAEBjT8O
         nghA==
Subject: [PATCH -perfbook 4/5] together: Fix usage of \clnref{} for 'lines M
 and N'
References: <d63ba139-abc7-3837-b44a-294a48a1b216@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5249cedb-9ff8-18e3-f480-a479b15efad5@gmail.com>
Date: Sun, 28 Mar 2021 17:57:07 +0900
MIME-Version: 1.0
In-Reply-To: <d63ba139-abc7-3837-b44a-294a48a1b216@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 together/applyrcu.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/together/applyrcu.tex b/together/applyrcu.tex
index bafda4e2..fb8645ee 100644
--- a/together/applyrcu.tex
+++ b/together/applyrcu.tex
@@ -156,7 +156,7 @@ is invoked by each newly created thread.
 	On the other hand, \co{count_unregister_thread()} can result
 	in the outgoing thread's work being double counted.
 	This can happen when \co{read_count()} is invoked between
-	lines~\Clnref{add} and~\Clnref{null}.
+	\clnref{add,null}.
 	There are efficient ways of avoiding this double-counting, but
 	these are left as an exercise for the reader.
 	\end{fcvref}
-- 
2.17.1


