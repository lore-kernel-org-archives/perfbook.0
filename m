Return-Path: <SRS0=ALPs=JB=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=xzGA6vn5PdP/HQ3Yg2ZBU4QZ/G6157k8BIbbIRPoZ2o=;
        b=AS2oyMChuhYPodXSfzcUc+ySrC8260IqzrigJbOiO2lx5/Y5riNVkzy4ouAHWvSk2u
         F4wUushnbe+7DXgyClcVUQNQKPhcaU/1dOvP6WglTHDYWR4vlap+y2Mj2gsTe0T5xedZ
         qVymd+MDjWlVJ33o4SI5ekeErcJNxtkqyeZBquHTuOYsfz0jj9f41i6O619I3Vogmp3M
         wsQukSa0KkD3of7L3qJ/nTfnGbNQlA5wcqsNb+inlH5YexMusvJhQURe4gh45kD8rM5g
         WWnuQFMl4RQz3wYuSNc9k5Uslw7LoEbstPg2xuJBuP0hsjZBhXqtF2rZTDde4aI2V0A4
         mm1w==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH v2 0/4] Trivial fixes for 'howto' chapter
Date: Sun,  4 Apr 2021 12:04:59 +0200
Message-Id: <20210404100503.20978-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, akiyks@gmail.com, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This patchset fixes trivial nits in 'howto' chapter.

Changes from v1
- Use '\Cref' for beginning of a sentence (Akira Yokosawa)

SeongJae Park (4):
  howto: Use '\cref' and '\Cref' instead of 'Chapter~\ref'
  howto: Add missed `~` for Paul's name
  howto: Provide a hyperlink to 'submitting-patches.html'
  howto: Fix a typo (License -> license)

 howto/howto.tex | 45 +++++++++++++++++++++++----------------------
 1 file changed, 23 insertions(+), 22 deletions(-)

-- 
2.17.1

