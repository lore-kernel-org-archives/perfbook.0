Return-Path: <SRS0=KFAY=RZ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IY0ar2pdpFmeBhVvxEHT7K/SCYJFJ4q7r0x+sY8k5YM=;
        b=dc/zbpyEqbi1y57z+r3jyKvDm5RXqYXysCwlY/y0OXbNlhcC71xwn65dPh+TICQCCS
         xKvQ5/4aYYaJK7PhXt0jMRZrX9IhRqNY7OVc3kUYssA7F7mIbpilUFDqIU8VTspf2kYr
         a0EOIV4BLeQzZSY8HgRSfNlVWAIt/8T34N2Ak7aQ2tvNWHFkA3kEHuLruVGqx4WlsS3K
         hvqnYZ072ct/iFi5Dg0Bk9YQXrZbWq9WBqbthcbRA0bNc3WVs1oL8XurbpHsUXts3k1K
         aL0BncNQuF52kzD5R3xTWfrUv8bYUYH2eKfZDn1FJC3HjRpu+uEF3Xbt8prtQNkXm4EC
         71yQ==
Subject: [PATCH -perfbook 3/4] defer/rcuintro: Fix trivial typos
References: <abc09d03-49ca-5350-0681-27e6a0e43ef3@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <bc8f196b-7acd-da88-23a3-06c4871edb63@gmail.com>
Date: Sun, 9 Jan 2022 09:01:07 +0900
MIME-Version: 1.0
In-Reply-To: <abc09d03-49ca-5350-0681-27e6a0e43ef3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Paul,

I think "the" in "the Section xxx" is redundant.
But please check before applying this.
2nd hunk should be the right fix.

        Thanks, Akira
--
 defer/rcuintro.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
index c5f2663b..bb79ec0b 100644
--- a/defer/rcuintro.tex
+++ b/defer/rcuintro.tex
@@ -181,7 +181,7 @@ So perhaps going all the way was not too far after all!
 
 But how can we tell when all of the pre-existing readers have in
 fact completed?
-This question is the topic of the \cref{sec:defer:Waiting for Readers}.
+This question is the topic of \cref{sec:defer:Waiting for Readers}.
 But first, the next section defines RCU's core API.
 
 \subsubsection{Core RCU API}
@@ -199,7 +199,7 @@ The \apik{rcu_read_lock()} and \apik{rcu_read_unlock()} functions delimit
 RCU read-side critical sections.
 These may be nested, so that one \co{rcu_read_lock()}--\co{rcu_read_unlock()}
 pair can be enclosed within another.
-In this case, the nested set of RCU read-side critical section act as
+In this case, the nested set of RCU read-side critical sections act as
 one large critical section covering the full extent of the nested set.
 The third read-side API member, \apik{rcu_dereference()}, fetches an
 RCU-protected pointer.
-- 
2.17.1


