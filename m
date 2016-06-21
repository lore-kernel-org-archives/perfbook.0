Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=DZokSNOsLnJJl7k/f5V92+L5qAK9Swe/Wgylv9p1ukE=;
 b=jtj7SAhzM2NWilZ2pP21nX0sN2QfEmBZ9X6PNrLI4gvXVPQyYomiVs3GtxcTnQO8wB
 Mv2ii8qEk4QDHuO3rpY20u9VSX/mtW0c/Qkz1CyVfnj6BCNebBURphnVVLDm/3R2l6Yy
 I4KYPVwcsaQcsNPNXKB4pvmqo6fg15M9r0/oIsN2Sd351Ctf5Nu+mGpuKxh6Ov2EWSw2
 yPY3JXXBTu2zx5tK41Nfqc1pilLHSp21nsjRL7Y9lV8viCgJ7RR9QH5i9QyC4Y4fwGaj
 ShuTMUc0+P399fri5zTgg4v4/H+rcEO70JZBRDqHc4r/pZJ8y4I8vJsvPTCxBESlSL4p
 DERg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [GIT PULL] Further tweak position of 'Just Count!' figure
Message-ID: <8469e8ad-a958-6543-6a2e-92baa0d5996c@gmail.com>
Date: Wed, 22 Jun 2016 07:37:07 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi,

I have tested the 'footmisc' package and it works!
Although there are reports of conflict between 'footnote' and 'hyperref'
packages, I have not seen any trouble.
Furthermore, I came across 'footnotebackref' package which enables
cross-link of a footnote at the bottom and the corresponding footnote mark
in the text. I added it in the last commit of this pull request.
Note that in older TeX distribution, you may need to install it manually.

                                                    Thanks, Akira
---
The following changes since commit 15ddcdd3ae6bdc088f7c49f78edf62fff5090cfd:

   Further tweak position of "Just Count!" figure (2016-06-20 10:30:49 -0700)

are available in the git repository at:

   https://github.com/akiyks/perfbook.git footnote-position

for you to fetch changes up to a3611df3582024130563ccb5167e39ca330aa804:

   Add 'footnotebackref' package (2016-06-22 06:56:26 +0900)

----------------------------------------------------------------
Akira Yokosawa (5):
       Revert "Further tweak position of "Just Count!" figure"
       Revert "count: Tweak position of Figure 5.1"
       Add 'footmisc' package for better placement of footnote
       Add comments on the purpose of additional packages
       Add 'footnotebackref' package

  count/count.tex | 44 ++++++++++++++++++++++----------------------
  perfbook.tex    |  4 +++-
  2 files changed, 25 insertions(+), 23 deletions(-)

