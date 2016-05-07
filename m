Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=BDr0OHozgqb7Ls2VelbqS9yUXC5j8+uGaGaNu+O72fk=;
 b=qnfNS1//GX12LhgeYIsvKtBjbYRWPluhyKyA8Mb/FW3+EEtPe9MYXct21tsfDhRacP
 uKI7YAwFxPT0p5MUDBUSJUAdy+bNGCPWFJNG7PAbcMU7VoMTkWii+Is9gMweRuED2gS8
 81hOP2uomLo02C6D3oOfHO9M+ugawcGi5i/sIzyx3FWh2UDJ6n4Sa4TptfzDIM7zreSP
 T/yqAb31TKTzNxBtSGIiDo/6FP5i93sLsfG8YfX07X0I7dhDd857SOsNLVm6HH8IB3wh
 pdmNo5B0zWervfzXpKlybGTkRi2qcT7j7QMJG32ULOo9xc9SQfdgxBsUJYbX+EvIrdQx
 C2wA==
Subject: [GIT PULL v3] Another round of build script tweaks
References: <3d253c44-5f0d-a809-119d-70f0ba38000e@gmail.com>
 <13c274c8-bde5-b13c-7c1b-64731a2298c2@gmail.com>
 <20160505132153.GG3750@linux.vnet.ibm.com>
 <5864f027-b0dd-ee44-0005-c9fb289bc8cc@gmail.com>
 <20160506110935.GA3593@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <9bef63f8-e639-598f-c422-573e178b261d@gmail.com>
Date: Sat, 7 May 2016 09:06:18 +0900
MIME-Version: 1.0
In-Reply-To: <20160506110935.GA3593@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi, Paul.

On 2016/05/06 04:09:35 -0700, Paul E. McKenney wrote:
> On Fri, May 06, 2016 at 08:47:13AM +0900, Akira Yokosawa wrote:
>> Is it OK to commit the fixes on the makefile-tweaks-v2 branch?
> 
> Make the above changes, and I will commit it.  "git rebase -i" is
> of course your friend for this task.
> 

It seems there were no advance in master since then, so rebase was
not necessary.

Pull request follows. Note that this is relative to the last one.
Do you prefer a request relative to the current master?

                                           Thanks, Akira
--- 
The following changes since commit c496b1d5c45dec5401658449d049d2b4e70148c4:

  Fix regression in Makefile (2016-05-05 08:23:46 +0900)

are available in the git repository at:

  https://github.com/akiyks/perfbook.git makefile-tweaks-v2

for you to fetch changes up to 8e169b78cd71b72afecfd4c2ad5843119da974fe:

  Makefile: Add comment on why 'extraction' is an empty target (2016-05-07 08:42:26 +0900)

----------------------------------------------------------------
Akira Yokosawa (5):
      Place trouble-shooting questions to FAQ-BUILD.txt
      Further tweaks of Makefile
      rm qqz.tex and add store15tred.esp to repository
      Remove rules related to perfbook_html
      Makefile: Add comment on why 'extraction' is an empty target

 .gitignore              |   10 +-
 FAQ-BUILD.txt           |   80 +
 FAQ.txt                 |   91 +-
 Makefile                |   82 +-
 advsync/store15tred.eps |  653 ++++
 qqz.tex                 | 7707 -----------------------------------------------
 utilities/runlatex.sh   |    6 +-
 7 files changed, 785 insertions(+), 7844 deletions(-)
 create mode 100644 FAQ-BUILD.txt
 create mode 100644 advsync/store15tred.eps
 delete mode 100644 qqz.tex

