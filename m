Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=tntacMPBnCkMrV2VUHQnohij18a0P3pVTSfw3makXhY=;
 b=xAy+0wjMbZvjg1sYGm384xciNnPQ+vch0y13SRXwIvN001l/MPM1OKYwhsY5UqJhAb
 AVk+F+orKWhvS6WMbPaf/Oiw2WlGsJ2ZnPeJh1TCSnN2kTXHvhQxg0X5QKBggewnBPSG
 nx6zCw3kdQVWbjSmW5X63hcae64PzMDc/ycXARq/KfmrJBiCHV0SCGTJtCCLfdhgjk4H
 1X2GI72IwdJqLjuVspj3ElynQ9Fh1sKi/kw62mkSxe3S04C92lbPdPEM1OPpJriXLqt+
 scRLeIMyEWoC6sI+jhknynS58cRREXGX+NV+k8AIUQSkHIPy8Ukf/SlrNb6qn7TnRy62
 ilnA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [GIT PULL] Another round of qqz improvement
Message-ID: <fd3e2eb5-8080-489a-60fa-72836512dd64@gmail.com>
Date: Thu, 7 Jul 2016 07:29:24 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This is another round of qqz improvement.
1st and 3rd patch improve vertical spacings in Appendix D.
2nd patch modifies the target of back link at the end of QQA
to the end of QQ in the main text.
This makes it easier to continue reading after reading an Answer.
The white box at the end of QQA is added recently, and its change
in behavior will cause little confusion if any, I think.

                                             Thanks, Akira

---
The following changes since commit 22af283e2a52cdf4a1c944fc97f00ce6a7a25ef8:

   Add diagnostics to route_rcu to reliably detect use-after-free (2016-07-05 15:52:16 -0700)

are available in the git repository at:

   https://github.com/akiyks/perfbook.git qqz-use-vspace

for you to fetch changes up to 746d78491c4dc47bcf72bfaf23724d568582d192:

   qqz: Give room for \parskip to suppress orphans (2016-07-07 07:07:17 +0900)

----------------------------------------------------------------
Akira Yokosawa (3):
       qqz: Use \vspace{} for vertical spacing in Appendix D.
       qqz: Modify back link target at end of QQA to end of QQ
       qqz: Give room for \parskip to suppress orphans

  qqz.sty | 22 +++++++++++++++++-----
  1 file changed, 17 insertions(+), 5 deletions(-)

