Return-Path: <SRS0=5QGv=MA=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XkHeBSh/2No3BzP6rJDvQxLYSuupc6AyFSFybM3ETrY=;
        b=PSIKNvpUyeIItydtQQvCIGnDgMWemfhIyvtyarsGzAaac7hylog9GwLOXIKNv5HGn/
         sDWP3lq1hTZBOA6dHP4RAv9rm5gwSh9QQllhsFuI+MNwBymFKNwPi8weSb16f3Sgwk23
         uCGNq7TcaNsHqOLJLo23xWXvZpooXb95PlNWc89pB6NdUgQJy0rW4hDK3/0c6jtieIeP
         CdlcSzia5RReXucE/R8jUVu4HMiSCtve0HrIj7bRBlAZYTTggWBTHTaBycBvJduVCkP0
         XXzL8u2Q5jFYB0TvS0kZJOCYugubyAE76N/TKRJclShwrGWIU6FtjZ0LxRH8CCvlnGBe
         Sb0A==
Subject: [PATCH -perfbook 5/6] locking: Remove Oxford comma in two-item list
References: <b502a83e-5a41-8ccb-1170-8cefd589e1a2@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <cbb76438-101a-9676-a4c6-61d5029e5d0c@gmail.com>
Date: Thu, 8 Jul 2021 19:45:19 +0900
MIME-Version: 1.0
In-Reply-To: <b502a83e-5a41-8ccb-1170-8cefd589e1a2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 locking/locking.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/locking/locking.tex b/locking/locking.tex
index 580d8766..7ae9a115 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -1326,7 +1326,7 @@ when needed rests with the developer.
 It is important to note that unconditionally acquiring an exclusive lock
 has two effects:
 \begin{enumerate*}[(1)]
-\item Waiting for all prior holders of that lock to release it, and
+\item Waiting for all prior holders of that lock to release it and
 \item Blocking any other acquisition attempts until the lock is released.
 \end{enumerate*}
 As a result, at lock acquisition time, any concurrent acquisitions of
-- 
2.17.1


