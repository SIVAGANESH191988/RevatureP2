package com.revshop.adminservice.serviceTest;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.revshop.adminservice.dao.AdminDAO;
import com.revshop.adminservice.dao.RetailerDAO;
import com.revshop.adminservice.entity.*;
import com.revshop.adminservice.service.AdminService;

public class AdminServiceTest {

    @InjectMocks
    private AdminService adminService;

    @Mock
    private AdminDAO adminDAO;

    @Mock
    private RetailerDAO retailerDAO;

    @Before
    public void setUp() {
        MockitoAnnotations.initMocks(this);
    }

    @Test
    public void testLoginSuccess() {
        Admin mockAdmin = new Admin();
        mockAdmin.setEmail("admin@revshop.com");
        mockAdmin.setPassword("password");

        when(adminDAO.findByEmailAndPassword(anyString(), anyString())).thenReturn(mockAdmin);

        int result = adminService.login(mockAdmin);

        assertEquals(1, result);
        verify(adminDAO, times(1)).findByEmailAndPassword(anyString(), anyString());
    }

    @Test
    public void testLoginFailure() {
        when(adminDAO.findByEmailAndPassword(anyString(), anyString())).thenReturn(null);

        Admin admin = new Admin();
        admin.setEmail("wrong@admin.com");
        admin.setPassword("wrongpassword");

        int result = adminService.login(admin);

        assertEquals(0, result);
        verify(adminDAO, times(1)).findByEmailAndPassword(anyString(), anyString());
    }

    @Test
    public void testViewAllBuyers() {
        Buyer buyer1 = new Buyer();
        Buyer buyer2 = new Buyer();

        when(adminDAO.findAllBuyers()).thenReturn(Arrays.asList(buyer1, buyer2));

        List<Buyer> result = adminService.viewAllBuyers();

        assertEquals(2, result.size());
        verify(adminDAO, times(1)).findAllBuyers();
    }

    @Test
    public void testApproveRetailerRequest() {
        doNothing().when(adminDAO).approveRetailerRequestById(anyLong());

        int result = adminService.approveRetailerRequest(1L);

        assertEquals(1, result);
        verify(adminDAO, times(1)).approveRetailerRequestById(anyLong());
    }

    @Test
    public void testBlockRetailer() {
        doNothing().when(adminDAO).blockRetailerById(anyLong());

        int result = adminService.blockRetailer(1L);

        assertEquals(1, result);
        verify(adminDAO, times(1)).blockRetailerById(anyLong());
    }


}
