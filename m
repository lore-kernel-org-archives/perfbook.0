Return-Path: <SRS0=vqDK=OX=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=F6WSmHcXZjsTRNusyx485Ux9sseZ0MyCb4ORG5JLzp4=;
        b=cQa+aL1sxDlO6GH1EQOptty+pYhk+8b7kHIpE1n09hz6wCbFPbltwbG+qcqqs+xHaL
         A1PQLqGkCGp7C8i19PeFX2qBb0Fd+ohFKnW5BfsUfpj1k5GaSnu2yBfMvTSqU4cnZzF6
         p8OoO17xP9OV80z7sQnizYLd7jqNP0OhHxM0S7ezjYYQDM+fo4+mXtx5+ZaG1WLLak5X
         81QqWCIkubdglJjifmFVj/VRvrcW9u+AwMiNQnF5I0N4h7GZkNiR+YZ0g2O/Z23q8KyB
         diYucDSZGTE12gMrp3U5nvSS6oDaJv4lQa2HJCV8G36QNdmAD0NA6gWFIk3HdzT10jVe
         yqUw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 0/6] Makefile: Add alternative eps --> pdf rules
Message-ID: <44597b0c-d73e-bacf-a3f1-2c5544d75f38@gmail.com>
Date: Sun, 3 Oct 2021 23:38:53 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This patch series attempts to add alternative rules for
"eps --> pdf" conversion independent of a2ping.

Patches 1/6 and 2/6 are preparatory changes.
Patch 1/6 adds targets for cleaning/building figure files.
They are convenient for switching between two sets of rules.

Build time of figure files listed below are measured using the
new targets, namely cleanfigs-eps and figs:

    make cleanfigs-eps; env time make -j4 figs

, and the baseline data corresponds to patch 1/6.

Patch 2/6 splits rules related to a2ping into a sub-makefile,
a2ping-rule.mk.  No behavior change is expected at this point.

Patch 3/6 adds the alternative rules in epstopdf-rule.mk.
They combine "eps2eps" and "epstopdf" commands.
eps2eps belongs to the Ghostscript bundle.
It generates normalized eps format, with proper bounding-boxes.
epstopdf accepts a proper eps file and convert it to pdf using
Ghostscript.
Using them together gives mostly the same pdf images as a2ping does.

As a matter of fact, a2ping was inspired from an old version of
epstopdf back in 2003 or so.

Patches 4/6 -- 6/6 are minor improvements to reduce file size and
build time of those pdf files.

Build time comparisons at patches 1/6 and 6/6 are shown below.
They are measured in container images hosted on a Ubuntu 18.04
box.  (Actual timing can be quite different on real systems.)

"focal"    -- Ubuntu 20.04 (Ghostscript 9.50, distro TeX Live 2019/Debian,
	      no "NimbusSanL-Regu", with "NimbusSans-Regular")
"bionic"   -- Ubuntu 18.04 (Ghostscript 9.26, distro TeX Live 2017/Debian
              + required up-to-date LaTeX packages)
"fedora"   -- Fedora 34 (Ghostscript 9.54.0, distro TeX Live 2019,
	      no "NimbusSanl-Regu", with "NimbusSans-Regular")
"vanilla"  -- Ubuntu 20.04 (Vanilla TeX Live 2021 as of Sep. 28, 2021,
              Ghostscript 9.55.0 built from source,
	      no "NimbusSanL-Regu", with "NimbusSans-Regular")

Elapsed time of "make -j4 figs" after "make cleanfigs-eps":

            Patch 1/6          Patch 6/6
            ------------  ---------------------
	    a2ping        a2ping       epstopdf
----------- ------------  ------------ --------
focal       0:41.77       0:40.19      0:24.56
bionic      0:39.30       0:38.42      0:22.47
fedora      0:41.63       0:40.09      0:23.30
vanilla     0:16.55       0:15.02      0:12.55
----------- ------------  ------------ --------

The lighter weight behavior of built-from-source Ghostscript is
likely due to the minimal config options I chose.

Anyway, the alternative rules are quicker on every container image
I have tested.

The alternative rules can be enabled by giving a "NO_A2PING=1" option
to "make", or by defining NO_A2PING as an environment variable.

I'll invert the conditional include and make "epstopdf-rule.mk" the
default choice once we are confident enough of the new rules.

        Thanks, Akira
--
Akira Yokosawa (6):
  Makefile: Add targets to build/clean figure files
  Makefile: Split rules related to a2ping into a2ping-rule.mk
  epstopdf-rule.mk: Add alternative rules for .eps --> .pdf conversion
  epstopdf-rule.mk: Reduce converted pdf size
  epstopdf-rule.mk: Save a 'cp' by running fixfonts script directly
  Makefile: Don't run fixfonts on .eps with embedded font

 Makefile         | 85 ++++++++++++++----------------------------------
 a2ping-rule.mk   | 69 +++++++++++++++++++++++++++++++++++++++
 epstopdf-rule.mk | 42 ++++++++++++++++++++++++
 3 files changed, 136 insertions(+), 60 deletions(-)
 create mode 100644 a2ping-rule.mk
 create mode 100644 epstopdf-rule.mk

-- 
2.17.1

