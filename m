Return-Path: <SRS0=JVx/=L2=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=mi2cEcmRDUfL370JJ2yFD64H5xG/lgA4KQNF6dDp9Mg=;
        b=UPSPK+FB4ChApytH1Id3rPCwx8fDgNPwQpQNdF1UOvzzGdBqWZIAep9nxPeI64Edc7
         0lL5a8IQLONeaHTttkijxiddaJVIhQ2UtS6/4xqO76b/q6dCci6KGPN/0akmKhUu0a3S
         D/sav9mtJ5bi89AbkMXcoB27Ra9/8voebhuiCmOBjSMEdByH5XbHLecU2iIy1J10qtZz
         +g5h997OKPxpZ+JushfjKxaL93peDLQrDn8r/c0lVP4l4JmeUF5bx3sDsDXQt4glyD50
         1+IU20eSniMrMEFb/mb3ailqHXDJdz3g/Niba5YzbLGWXLuF+5EHX/yJD8fJUsyYhtSg
         aemw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] future/htm: Remove ref to Tabel 17.3 in QQ
Message-ID: <27d3f40f-e51f-7f92-1bfa-e64149a55b37@gmail.com>
Date: Fri, 2 Jul 2021 10:52:21 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Table 17.3 is not available in EBook-size builds.
For compatibility, remove reference to the combined table in Quick
Quiz added in commit 279c38a988f9 ("future/htm: Add some HTM
hardware-reliability anecdotes").

Fixes: 279c38a988f9 ("future/htm: Add some HTM hardware-reliability anecdotes")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

Current master fails to build "eb".
I think reference to Table 17.3 is not essential to the Quick Quiz
and just removed it.
If you think otherwise, it can be made conditional by \IfEbookSize{}{}.

        Thanks, Akira

PS: As for hardware implementation of transactional memory,
Power ISA v3.1 deprecated it [1].
It might be worth mentioning it in the Answer to the QQ.
In the post specter world, it looks like almost impossible for hardware
designers to come up with a secure implementation of HTM...

[1]: Appendix A of Power ISA v3.1 at
    https://ibm.ent.box.com/s/hhjfw0x0lrbtyzmiaffnbxh2fuo0fog0
--
 future/htm.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/future/htm.tex b/future/htm.tex
index abc80daf..3ff9bf24 100644
--- a/future/htm.tex
+++ b/future/htm.tex
@@ -917,7 +917,7 @@ tab:future:Comparison of Locking (Augmented by RCU or Hazard Pointers) and HTM}.
 }
 
 \QuickQuiz{
-	\Cref{tab:future:Comparison of Locking and HTM,tab:future:Comparison of Locking (Plain and Augmented) and HTM,tab:future:Comparison of Locking (Augmented by RCU or Hazard Pointers) and HTM}
+	\Cref{tab:future:Comparison of Locking and HTM,tab:future:Comparison of Locking (Augmented by RCU or Hazard Pointers) and HTM}
 	state that hardware is only starting to become available.
 	But hasn't HTM hardware support been widely available
 	for almost a full decade?
-- 
2.17.1

