Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=8KWP5BjLn07gFVCpCWlkCDppTiwX/Jap6pT6eVWKJQQ=;
 b=sY6iShsYCh1qfLzvYUgw+ge9oUUvB9quRzIqY8odGTA3uE1fUswmKHj5VgayGKG1dq
 a8DFIEWA1XcFoLKm2cgIJLstyZGHMUqIVsLaPcYtSUwtuxNcjHpwIkLsG3vMeYPVnYBE
 ZXlzq+eBVkd+D4+fWm6YGH25H9GC5OH1uvDLcKCxkasKPNJWuTNuQfo4YIQSpzAy+JxA
 Jqa30+yAUT8Oy03kLgKkrq3yuuNP3CCO/SrGkqWwvutYPvqhzvDk06/CJRU0Mf7TqzKw
 TyX7EWWTUr91wdmpFqp3DeglI3SS2XwKpcBJBeQ8N8Y+cMhR/2JbscphKN/bXLblWaJQ
 QAeg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [GIT PULL v2] Fix false positive font warning and update related
 documents
Message-ID: <f3ad99e8-8d6f-5910-9aad-35a35bfb3ea6@gmail.com>
Date: Sat, 21 May 2016 09:13:08 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

The following changes since commit adc5a0ed9702d1fa2ec8620b1ff16ed2fbd6b9a4:

  Fix typo "baloon" -> "balloon" (2016-05-18 18:30:31 -0700)

are available in the git repository at:

  https://github.com/akiyks/perfbook.git fix-false-positive-v4

for you to fetch changes up to bd11b0d690485e0110d9ab31562a790f39d9abe6:

  Improve messages regarding font installation (2016-05-21 09:09:41 +0900)

----------------------------------------------------------------
Akira Yokosawa (2):
      Fix false positives in font check
      Improve messages regarding font installation

 FAQ-BUILD.txt         | 6 +++---
 howto/howto.tex       | 9 +++++----
 utilities/eps2pdf.sh  | 4 ++--
 utilities/runlatex.sh | 4 ++--
 4 files changed, 12 insertions(+), 11 deletions(-)

