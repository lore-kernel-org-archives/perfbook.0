Return-Path: <SRS0=Q5ML=JF=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fmSDVJQgJIrE0PAJljrxsP5Z53Q32xpsdZaJGtesdZo=;
        b=eemC2q2q/sHm1MBpCXf3NKjErCrHBPF5E8Ip9LGj7taHpoki5Ic8lT47zj3FOah/zE
         k+rhmM08t+LVsaF1ThKN1YQstz3Q2HpfQ/3CuASrNnOp53CYbvH51OtumthGi0FN3diP
         +WrC3m8aEBiri1gv3Cq1gWX9I20VMwG7QnRwnY56hPvvv0PRI8fsWRePbDBNYHxt5TTr
         QyykpPSjRq2mTnAPs9CAVeMAW0geceFT/WG7MhILSIezBkej84r4zrfBjLoe54e9Vi6K
         v5KiaFwIrB3D6VVBILS+1vXXViYMYhbqHdF07OjDkoWrwvVA22Oh5uRllm/IWV8ukpMH
         tDrw==
Subject: [PATCH -perfbook 2/2] qqz: Suppress possible orphan heading
References: <892ebe26-b120-a726-434b-97ab25187b53@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e5279b3d-ed7f-8b74-5e12-831b6cf39208@gmail.com>
Date: Thu, 8 Apr 2021 20:10:19 +0900
MIME-Version: 1.0
In-Reply-To: <892ebe26-b120-a726-434b-97ab25187b53@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

As of Edition.2 and current master, heading of Appendix E.7 is
orphaned in perfbook.pdf.

This is because framing of quiz part at the beginning of a section
implies paragraph break and invalids the afterheading-ness of the
first question.

To suppress such an unfortunate result, tweak the \bottomtitlespace
variable of the "titlesec" package for Appendix E.

Positive length of \bottomtitlespace prohibits a section title
to appear in the bottom part of that length and forces the title
to be on the next page.
This should be acceptable in Appendix E.

There exist the same patterns of quick quiz at the beginning of
a section in the main text as well as in -nq builds, which might
cause an orphan heading.

Such cases would be dealt with case by case bases.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/appendix.tex | 1 +
 1 file changed, 1 insertion(+)

diff --git a/appendix/appendix.tex b/appendix/appendix.tex
index 9218b1f1..f2640157 100644
--- a/appendix/appendix.tex
+++ b/appendix/appendix.tex
@@ -6,4 +6,5 @@
 \include{appendix/toyrcu/toyrcu}
 \include{appendix/whymb/whymemorybarriers}
 \include{appendix/styleguide/styleguide}
+\renewcommand{\bottomtitlespace}{.08\textheight}
 \QuickQuizAnswers
-- 
2.17.1


