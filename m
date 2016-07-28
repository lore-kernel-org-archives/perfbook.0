Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=TuwLceCs+PZdgjRpiaOIOvtbPCY4IueWozuKBzNefYY=;
 b=INveU1eiGCLis28hRnKLS0lPo83KZGkhvXzutI3VPNeV1eCPRFrk05kafYVurTA2ah
 vk0tVZEoDPAvkxUfdUzTFE4EPUv1JZDEoha4CmC/UaWhWUuj0WP+R//+Ummm2E3ACHhy
 GzGQYPVTyHh6YcV/JcGVj71OZbMigPH5Ho3GsgaF1ads5LhTOrBxuCM9rx3RptD8BvRV
 0D0kR2v9ICVOotUvfM61Ii7PDL5vbQqqUhiQAQqESMsnKa9AL0MhYanVPzBaZhVk3MY7
 xdmrhiYy5POUTN7SJkQH/JMVvv4VGNFFB8k/99KRRb3EFxe2e+KwoKdPWO7Dc297bp/U
 9mXQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Some more feedback on Chapter 9
Message-ID: <a6181fde-e96e-294c-d0df-e996c27b401f@gmail.com>
Date: Thu, 28 Jul 2016 22:06:22 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

There are still several issues regarding Chapter 9 I want to feedback.
I'm afraid most of them are beyond my ability to submit as patches.

* At the beginning of Section 9.5.2, there is a credit of the form
  "Authors: ...".
  But there is \OriginallyPublished{} command just above the credit.
  I'm wondering if the credit in the text is necessary.
  There is a similar credit at the beginning of Section 14.2, but there is
  no \OriginallyPublished{} command there. This section seems to have been
  written for perfbook. If this is the case, for a consistent look, it would
  be better if the credit is moved to Appendix F.1.

* Position of Quick Quiz 9.44 looks a little premature. SRCU is  mentioned
  just after the Quick Quiz.

* The 2nd sentence of Section 9.5.4.4 ends as "... in the companion article."
  This seems like a vestige of its origin in LWN. Should be fixed to match
  the context.

* In the introduction of Section 9.5.5, understanding of the whole Chapter 9
  is listed in the prerequisite for the "toy" implementation. I suppose
  recursion is not intended here.

* Also in the introduction of Section 9.5.5, Section 9.5.5.2 is not mentioned.

* (Typo) In the 2nd paragraph of Section 9.7, there is a redundant "can" in
  "... so that updates can can operate locally, ...".
  (Yes, I can submit the fix of this one as a patch. If you want me to do so,
  please let me know.)

* (Apart from Chapter 9) In Section 14.2.10.1, there are four instances of
  $\dagger$ for introducing notes. I'm wondering if they can be converted
  to footnotes. I'm not sure where they should be placed in the text, though.

I said earlier there were a few issues, but in the end there are a quite a few.

I don't mind if some (or all) of them be taken care of later after the upcoming
release.

                                                      Thanks, Akira

