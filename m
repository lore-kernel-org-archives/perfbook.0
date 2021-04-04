Return-Path: <SRS0=ALPs=JB=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=IiaWqakUC3S0vkmp0U5a+lnrxhRV6Nde+xQsFzswNKI=;
        b=CUghCQkNbm4SNXe/C+90OOQgRRe+DHtn6WnVm23kJOAuL7eyfxtAqh2A6OkCuKN1hB
         t+tCh4fQr4Z4+AhcFGi1LQzEM/JiKNKj7MN1GmTo5AIZW58N///LFWqoa+9WwkZNo3HR
         F6R8gkq+7C2WwkFUsF4L7YErsjkKwXm8DQL3yMB+KBWiUanqVTDD+Pgxymzuu2UEwWtU
         SYHt91Yy+SU/keSN/eIHPH6qMsgF9Tohk3SsSh4xFTH3jogxy/MjVP3fJwe86KIYrkFb
         0XN9Sy5X4EEUAhoKucLIIP1zS3TH+n4xLkd56LfUNZwS5NZuV04nkIP9m259/9imdbjw
         Q3/Q==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH v3 0/4] Trivial fixes for 'howto' chapter
Date: Sun,  4 Apr 2021 13:10:40 +0200
Message-Id: <20210404111044.27774-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, akiyks@gmail.com, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This patchset fixes trivial nits in 'howto' chapter.

Changes from v2
- Use '\cref' and '\Cref' more widely (Akira Yokosawa)

Changes from v1
- Use '\Cref' for beginning of a sentence (Akira Yokosawa)

SeongJae Park (4):
  howto: Use '\cref' and '\Cref' consistently
  howto: Add missed `~` for Paul's name
  howto: Provide a hyperlink to 'submitting-patches.html'
  howto: Fix a typo (License -> license)

 howto/howto.tex | 59 +++++++++++++++++++++++++------------------------
 1 file changed, 30 insertions(+), 29 deletions(-)

-- 
2.17.1

