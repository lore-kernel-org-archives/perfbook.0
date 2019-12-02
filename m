Return-Path: <SRS0=7eUo=ZY=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=qvkUVZ/UfFMT0occ5fmRB4WeHsbtz1pIT9gQ3rojIqk=;
        b=XZMsSwyUhQzfnh8MqFmiiDrG7IaMyg8bO6U/MIRqO0LkGI8jbG8XTzsiSXlG2HwNQw
         Okz+96M8Lsnc/eqFqk0ZcwrQmI9+iBZQHXqyREsPrEPR4rwwypKtCoSAfAghFXcOIdkT
         tv6x1FbS99/sQS9XcZKBu8wLP7NyAAH958qPIrI9c/q4wcwPUQxA1ry3yCPdRJBw8a2a
         z8fJdUUKMs3ZFj8ElItz+sJZx/gytkRuQU+qZyRYLht88hb0mD4XiCfK3wN0LGDj5Ri+
         zD+rW4VEL7xL2a8I72nrZkcDg1nbdMYjbSmEk/jWbpuT+5Xksgv0rYRK53at60SlIqnS
         J+FQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/6] Misc updates (a2ping vs Ghostscript, appendix/ack, Style
 Guide)
Message-ID: <bd2bcae7-bfde-241f-281c-832615d1c9c0@gmail.com>
Date: Tue, 3 Dec 2019 00:14:21 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This patch set is the collection of updates I've made over the
weekend.

Patches #1 and #2 result from a compatibility-breaking change in
Ghostscript 9.50.  I noticed it while testing Ghostscript 9.50 on Fedora 31
as a workaround of Ghostscript 9.27's bounding-box regression. a2ping 2.83p
no longer works with gs 9.50.  I asked a2ping's maintainer for an update,
and 2,84p has been released recently.

Patches #3 and #4 fix a typo and make use of \Cref{} macro in the reviewers'
list.

Patch #5 is a response to your addition of newline-after-sentence rule.
The rule talks about coding style in LaTeX source.  OTOH, the other
conventions talk about the result of typesetting. So I made it an
individual itemize list.

Patch #6 updates the way we call the new (current) snippets.

        Thanks, Akira

PS (Reminder to Paul):

Info on the frontpage needs updates (email address, where you work at).

--
Akira Yokosawa (6):
  Makefile: Add compatibility check of Ghostscript and a2ping (9.50 vs 2.84p)
  FAQ-BUILD: Add a workaround for Fedora's Ghostscript regression
  appendix/ack: Fill in missing ')'
  appendix/ack: Use \Cref{} for cross references in reviewers list.
  styleguide: Clarify newline-after-sentence rule is for LaTeX source
  styleguide: Treat current snippet scheme as 'the scheme'

 FAQ-BUILD.txt                      | 24 +++++++++-----------
 Makefile                           | 23 +++++++++++++------
 appendix/ack/ack.tex               | 36 +++++++++++++++---------------
 appendix/styleguide/styleguide.tex | 11 ++++++---
 4 files changed, 53 insertions(+), 41 deletions(-)

-- 
2.17.1

