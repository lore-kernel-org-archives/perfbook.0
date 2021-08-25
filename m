Return-Path: <SRS0=Ut+l=NQ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=SxnvIDVQW9iZ0/ylm05dZJDJc6nPGIIb+68SReeaXug=;
        b=WkRHF+/3XGHCNeZYsn/dHRkSWMOeiT0CdaC+SQLCMkylCA7aMYvbrts5bZgscRC1zV
         EKqbYLxS4lqzj0GBk2Sxb5cVv/tK44VmmslcLsQ5OsNNsUrpXQBXkn/WMSoFbBXjkJAU
         mv/eUL5mry6qm4LWAhazoEXcDoF3JjclatvsLIqqbSxbAa2sOsQTdxMES6fLx1LFod6O
         z77vIeHWyV47BMlBU18O2JC+QyVUtHIrnT+jD/Rg76zVXm9Edz6iBA3QaWX8pB7xNE02
         qsoLI0efpCEzH67Dzu4kS0UZnylPJ3qPSonWqKNITcvFnyYaSFTmakmK72j3iiAPNlRT
         21tw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 0/5] End-of-sentence punctuation after "Appendix X"
Message-ID: <8e4ab0b0-2a64-3ff6-e35a-38778d9622cf@gmail.com>
Date: Wed, 25 Aug 2021 18:34:50 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

There remain a few places where end-of-sentence periods are followed
by single spaces.

Patch 1/5 is a follow-up of QQA expansion in datastruct, unrelated
to end-of-sentence punctuation marks.
Patch 2/5 fixes wrong spaces after "Appendix X.".
Patch 3/5 updates periodcheck.pl so that punctuation marks after
end-of-sentence "Appendix X" can be caught.
Patch 4/5 modifies the label string of Appendix E so that the
script updated in Patch 3/5 can recognize it.
Patch 5/5 fixes a typo I came across while preparing this patch
set.

        Thanks, Akira
--
Akira Yokosawa (5):
  datastruct: Reference Figure 10.11 to clarify discussion flow
  treewide: Annotate end-of-sentence periods after 'Appendix X'
  punctcheck.pl: Add regex to catch punctuation marks after 'Appendix X'
  Adjust label of Appendix E 'Answers to Quick Quizzes'
  appendix/questions: Fix typo of missing ')'

 ack.tex                          |  2 +-
 appendix/questions/questions.tex |  2 +-
 cpu/overheads.tex                |  2 +-
 cpu/overview.tex                 |  2 +-
 datastruct/datastruct.tex        |  5 +++--
 defer/rcuintro.tex               |  2 +-
 howto/howto.tex                  | 12 ++++++------
 qqz.sty                          |  2 +-
 utilities/punctcheck.pl          |  3 ++-
 9 files changed, 17 insertions(+), 15 deletions(-)

-- 
2.17.1

