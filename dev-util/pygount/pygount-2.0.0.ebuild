# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( pypy3 python3_{8..13} )

inherit distutils-r1 pypi
IUSE="doc"

DESCRIPTION="Command line tool similar to sloccount and cloc"
HOMEPAGE="
	https://github.com/roskakori/pygount
	https://pypi.org/project/pygount/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~arm ~arm64 ~loong ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86"

RDEPEND="
	>=dev-python/pygments-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/chardet-5[${PYTHON_USEDEP}]
	<dev-python/chardet-6[${PYTHON_USEDEP}]
	>=dev-python/rich-9.0.0[${PYTHON_USEDEP}]
	<dev-python/rich-15[${PYTHON_USEDEP}]
	>=dev-python/gitpython-3.1.31[${PYTHON_USEDEP}]
	<dev-python/gitpython-4[${PYTHON_USEDEP}]
"
# FIXME source tarball doesn't include docs or tests
#BDEPEND="
#	test? (
#		>=dev-python/pytest-8.0.0[${PYTHON_USEDEP}]
#		<dev-python/pytest-9[${PYTHON_USEDEP}]
#	)
#	doc? (
#		>=dev-python/sphinx-7.0.0[${PYTHON_USEDEP}]
#		<dev-python/sphinx-8[${PYTHON_USEDEP}]
#	)
#"
#
#distutils_enable_tests pytest
#distutils_enable_sphinx docs
