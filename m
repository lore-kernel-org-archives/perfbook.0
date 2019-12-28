Return-Path: <SRS0=q0D/=2S=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=kTFY6dY7hpaUuJveS1+1DIyLvfivenkK89CVNTSGSpQ=;
        b=FIc1R0TwGdIH3GegAW/hiJ3MyWWPV8Dkl13oMDeKN/jvHfeN6VuI3WK/x5R1ogpLXV
         UvIjDrSh3VGI/l+C88Hlt9Jj/bhz9875PCBNgMBVspI3r6A22g3/9dEqv/XPq3c+wE4I
         /Z9FVa3PGuJDGuDUBwIeHc9/e1Z04DVqup61v+XsMHKbfjaXFAG4HRhLbSzDflk7Vpq8
         quW6TcoX5REV3whHidUVyyy7zpAHIYSAHR/XP+8PpdnwG6IulSRiO5Az0bDHVY+vqBcu
         vSm2EcKZznxmpuRRKZkr+dt7+t53oYO4Cdvz+6oadPguqxwsycoaOuxcV0YVM5WXD6VX
         6fAg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/2] appendix/questions: Updates in ordering
Message-ID: <64715baf-7214-037d-ab82-324683ba2dbf@gmail.com>
Date: Sun, 29 Dec 2019 08:30:54 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This patch set is mostly to educate you on the the way to use \cref{}
\Cref{}.

In the current setting of the cleveref package, there is no difference
whichever you use. But it is possible to make \cref{} to generate
e.g. "Sec. n.m" instead of "Section. n.m" to save some space.
They say abbreviation in the beginning of a sentence should be
avoided.

Such an attempt should wait until the time we finish the conversion
to the cleveref style cross-references.

        Thanks, Akira
--
Akira Yokosawa (2):
  appendix/questions: Fix 'cleveref' macro usage in ordering section
  appendix/questions: Use nbsp in 'value n'

 appendix/questions/ordering.tex | 39 ++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 20 deletions(-)

-- 
2.17.1
