Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=pNv95huYkEhDStlja8xRRD0Lz8E0XcTpEMLwAZwXHn4=;
 b=SC8cGWCoPNhbM0W0jN9QcqW+emTCWLYqZhQXxxImz598pon4u348CqCdqE73/1pJ/N
 YTViPcwGWOLCB9v8B37EOMohS+FViI40z83AGECxOhSPbeouqJm0J/LTHj7jrHKozZOm
 Qmkjn4lb2rK2dH8bpB6MDAdcjias7FWaGjw1UCAKrmjddJNcYKoFGZBEZU/iBz/C/vKy
 CLky26u/wG4FfuXCu3DF+W57WzmIW3qGFQ7h5dS2Ul8uZ3P40Iv08odzI67GA7LYeL6S
 wvxGhuVBqLjMza/OYw6fLwPgtOdl5m8Mz9FABEANmRsQKkIYZoHzcG1DJCSeeJj2gzQS
 e9yg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [GIT PULL] another qqz improvements
Message-ID: <f8e63b55-fd26-8b7b-2b29-9d9b42d4e017@gmail.com>
Date: Sat, 2 Jul 2016 21:09:40 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-2022-jp; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi again Paul,

So, this is another round of qqz improvements.

This time, I added cross link reference at the end of each QQ and QQA.
For QQA, I picked a special character from 'pifont' package which looks
like a white box.

See https://en.wikibooks.org/wiki/LaTeX/Special_Characters

Now, by clicking the black box at the end of QQ or white box at the end
of QQA, you can go back and forth between main text and Appendix D.

2nd patch improves accuracy of back link from QQA.

3rd patch adds macro for referencing answer of QQ.

The 2nd one changes column/page break behavior a little, but
I think it is acceptable.

Please give them a try.

Note that this pull request is relative to current master.

                                                        Thanks, Akira

---
The following changes since commit 91ac20e1ab95767f1e33b84aee474d0cd38cc748:

   hlist_for_each_entry_rcu() now has only three arguments (2016-07-01 13:31:02 -0700)

are available in the git repository at:

   https://github.com/akiyks/perfbook.git qqz-additional-ref-mark

for you to fetch changes up to f42deae9dbca3f7e6851a813c6504427c4dba809:

   qqz: Add macro for referencing quick quiz answer (2016-07-02 19:02:43 +0900)

----------------------------------------------------------------
Akira Yokosawa (3):
       qqz: Add cross-link reference at the end of each QQ and QQA
       qqz: Improve accuracy of qqz back link
       qqz: Add macro for referencing quick quiz answer

  perfbook.tex            |  1 +
  qqz.sty                 | 17 +++++++++++++----
  utilities/extractqqz.sh |  2 +-
  3 files changed, 15 insertions(+), 5 deletions(-)

