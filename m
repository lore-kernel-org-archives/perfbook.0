Return-Path: <SRS0=kqNA=U3=gmail.com=haolee.swjtu@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding:user-agent;
        bh=nBWixwkz3spGxsc4hozhc447gsLenCwJEa/Moz3fkmo=;
        b=lWrq1h5600Xj/ClSRe7Qw3EYzY71CIIEz2XOeX9dU/AGncavTDjsfA7Hh1WRQT8tZL
         1zliDLl4kh5xy7yvPaG7WeF3RE0oC4ZLi19RSMao3I0eapZYtb5vF7wOpy0XNNLgh6/Z
         JHXGDzwZVnbeYDpo12IDcdlU+kDpyvLV0LqJlc+BhSUkxUCUKVY6rhAOC+HmM4/h6Mcv
         STP3tCuSX6NY8V0DRLD2VB7dfrv/NZRiCh+yLypmwqHzhjUrSL/qCNLbt7j4Jf0BNYgi
         o7WZPk+PJfBD+LryT93rX7nAJEZ31ut52CZILByqL7U93MVrvA8pvdxHAVshvwtTZLvl
         ae7A==
Date: Sun, 17 Apr 2022 11:17:26 +0000
From: Hao Lee <haolee.swjtu@gmail.com>
Subject: Clarify what the read memory barrier really does
Message-ID: <20220417111726.GA27498@haolee.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hello,

I think maybe we can make the following contents more clear:

Cite from Appendix C.4:

	when a given CPU executes a memory barrier, it marks all the
	entries currently in its invalidate queue, and forces any
	subsequent load to wait until all marked entries have been
	applied to the CPU’s cache.

It's obvious that this paragraph means read barrier can flush invalidate
queue.

Cite from Appendix C.5:

	The effect of this is that a read memory barrier orders only
	loads on the CPU that executes it, so that all loads preceding
	the read memory barrier will appear to have completed before any
	load following the read memory barrier.

This paragraph means read barrier can prevent Load-Load memory
reordering which is caused by out-of-order execution.

If I understand correctly, read memory barrier has _two functions_, one
is flushing invalidate queue to make the loads following the barrier can
load the latest value, and the other is stalling instruction pipeline to
prevent Load-Load memory reordering. I think these are two completely
different functions and we should make such a summary in the book.

Regards,
Hao Lee
