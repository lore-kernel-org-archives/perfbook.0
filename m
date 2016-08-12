Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=1VzY5IU0rsNQQxJ7YCJdTNBkWyQQ7tkdZnG+mb/SltA=;
 b=0sT79iwKm8ie7HIrxDxVXm+LjueBu0HHgj29/EcP5GxTbBoEYhX4/N2pSpXXic2UOT
 oFkODGOUlErHpwir+JCwuPU5qbFG5Kf5Ulv8yEyUiRQF5WnU2EJZ/KSrr4crTg/0E4ku
 YhGoE/SDJMoN6yM6xPljusLRQs3YZUW5o/GZiYmOmcJmv3F8GJVNtZ+3PH72FGI7KuAk
 W6GGn2JR6TRpd7YrhU1KDVIe0itsjbgPXBcV33AmDEr0VJjWK6dh1NhfiMAspb2pkOo8
 33xXYFieYGziaLrhv1Xc8TnhkQdZZ+Rbf+vSeXp/YAgoKCHzYsgIObDAungFQDH82La1
 Zwdw==
Subject: [RFT GIT PULL v2] Makefile: Add ".fig -> .eps" rule
References: <2d788653-610c-bc99-0d70-f86b96056c7e@gmail.com>
 <20160811175403.GB3482@linux.vnet.ibm.com>
 <89115e47-37d6-b563-435e-6dbecf078963@gmail.com>
 <20160811233940.GH3482@linux.vnet.ibm.com>
 <88b66a0b-6b1b-2627-d262-c7c95a8aa69d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <54cbc8fb-9189-8ec3-b0cd-5e0b984e861f@gmail.com>
Date: Fri, 12 Aug 2016 10:56:11 +0900
MIME-Version: 1.0
In-Reply-To: <88b66a0b-6b1b-2627-d262-c7c95a8aa69d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

I've added the availability check of "fig2eps" in Makefile, as well as that of "dot"
command which was added fairly recently to necessary commands.

I hope this helps people after the merge of branch.

If you want to see what the error message would look like, after pulling this branch,
modify the definition of "FIG2EPS" or "DOT" macro around line 40 of Makefile,
then "make neatfreak; make" will show a false positive error message.

This pull request is relative to the previous RFT pull request.

                                                    Thanks, Akira
-------
The following changes since commit 641b6a5541323d737b1e2ca31e9a805da19514f1:

  FAQ-BUILD.txt: Add 'fig2ps' as necessary package on Ubuntu (2016-08-11 22:50:02 +0900)

are available in the git repository at:

  https://github.com/akiyks/perfbook.git makefile-add-fig-eps-rule

for you to fetch changes up to 7f8776ab67bb37bccb7128dc67be6c85a5aacfb6:

  Makefile: Add availability check of 'fig2eps' and 'dot' commands (2016-08-12 10:39:36 +0900)

----------------------------------------------------------------
Akira Yokosawa (1):
      Makefile: Add availability check of 'fig2eps' and 'dot' commands

 Makefile | 10 ++++++++++
 1 file changed, 10 insertions(+)

