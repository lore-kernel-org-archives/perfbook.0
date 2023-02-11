Return-Path: <SRS0=d1CH=6H=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQmB762BVO2/40f2lLjybmQL/IgxkkK5c/tib28KMHQ=;
        b=PaAsUa8i6UCHpMQpP+zMXvT+Z//plZYl7q3wvj1gttDeDR/PwDFfnaTtIyUV3I0oLz
         /KHFt+/wRgPjGS/c55nklAuCFVVD+Jt4Ux8J6+1vou0WvC0myBYdZsLgZq0x1NlXvBpS
         F5DRUXPip1PcaVSdzKqTOYQBnlbxW914lOcuEujAsMAqYj59Nq2y8GjG95NlkgEiCVwx
         MS1nI+ic3gf8qRP6P3sMABdBantR1C2LjVbJH34sQ9HXAgHYVgKKqqKdEM+9Kymk8i+B
         lEIyDSdF3DY9tON+V2F8Marq/r9AyMj5/ke/0cI3ThrSjUF1O+KIX7IEoj9u3/HQsGXQ
         J3+A==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH v2 0/4] debugging: Trivial fixups
Date: Sat, 11 Feb 2023 09:10:04 -0800
Message-Id: <20230211171008.9415-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: akiyks@gmail.com, perfbook@vger.kernel.org, sj38.park@gmail.com, sj@kernel.org
List-ID: <perfbook.vger.kernel.org>

Changes from v1
- Use 'qco{}' for quoted strings (patch 1, 2) (Akira Yokosawa)
- Explicitly distinguish section and subsection (patch 4) (Paul E. McKeneeny)

-----

This patchset contains trivial fixups for debugging/, which found while
doing Korean translation[1].

[1] https://github.com/sjp38/perfbook-ko_KR

SeongJae Park (4):
  debugging: Use \co{} for 'time' output examples
  debugging: Use \co{} and \qco{} for 'git' and 'Fixes:', respectively
  debugging: Remove unnecessary space in a sentence
  debugging/debugging: s/remainder of a section/following sections/

 debugging/debugging.tex | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

-- 
2.17.1

